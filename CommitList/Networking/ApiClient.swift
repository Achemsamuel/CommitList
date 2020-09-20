//
//  ApiClient.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

final class ApiClient: NSObject {
    
    let decoder = JSONDecoder()
    let defaultSession: URLSession
    
    override init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60
        // use saved cache data if exist, else call the web API to retrieve
        config.requestCachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
        defaultSession = URLSession(configuration: config)
    }
    
    /*------------------------
     Get
     ------------------------*/
    
    func getGitHubCommits(query: String, params: [String:Any], completion: @escaping ((Result<[CommitResponse], Error>)-> Void)) {
        let url = HTTPEndPointResources.railsGitCommitsUrl
        get(urlSuffix: url, params: params) { result in
            switch result {
            case .success(let data):
                do {
                    let commits = try JSONDecoder().decode([CommitResponse].self, from: data)
                    completion(.success(commits))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func get(urlSuffix: String, params: [String:Any], completion: @escaping (Result<Data, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: urlSuffix) else {
            completion(.failure(AppError.badUrl))
            return
        }
        //add params to the url if any
        urlComponents.queryItems = params.map { (arg) -> URLQueryItem in
            let (key, value) = arg
            return URLQueryItem(name: key, value: "\(value)")
        }
        /*
         Most web services need + character percent escaped (because they'll interpret that as a space character as
         dictated by the application/x-www-form-urlencoded specification). But URLComponents will not percent
         escape it. Apple contends that + is a valid character in a query and therefore shouldn't be escaped.
         Technically, they are correct, that it is allowed in a query of a URI, but it has a special meaning in
         application/x-www-form-urlencoded requests and really should not be passed unescaped.
         
         Apple acknowledges that we have to percent escaping the + characters, but advises that we do it manually:
         */
        //urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "+")
        
        guard let url = urlComponents.url else {
            completion(.failure(AppError.badUrl))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let task = defaultSession.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print ("error: \(error!)")
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            guard let content = data else {
                print("get(): No data")
                DispatchQueue.main.async {
                    completion(.failure(error ?? AppError.emptyResponseData))
                }
                return
            }
            print("Apiclient \(url) \n\(String(describing: String(data: content, encoding: .utf8)))")
            DispatchQueue.main.async {
                completion(.success(content))
            }
        }
        task.resume()
    }
}
