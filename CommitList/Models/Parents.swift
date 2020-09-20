//
//  Parents.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

struct Parents: Codable {
    var sha: String?
    var url: String?
    var htmlUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case sha
        case htmlUrl = "html_url"
        case url
    }
}
