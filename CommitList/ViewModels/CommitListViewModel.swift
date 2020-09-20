//
//  CommitListViewModel.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

final class CommitListViewModel: NSObject {
    
    private var disposeBag: DisposeBag!
    private(set) var rx_commits: BehaviorRelay<[CommitResponse]> = BehaviorRelay(value: [])
    private(set) var rx_setEmptyStateViewVisiblity: PublishSubject<EmptyStateReason> = PublishSubject()
    
    override init() {
        super.init()
        initialSetup()
    }
    
    private func initialSetup() {
        disposeBag = DisposeBag()
        fetchDataOnLoad()
    }
    
    private func fetchDataOnLoad() {
        guard ReachabilityHelper.isInternetAvailable() else {
            self.rx_setEmptyStateViewVisiblity.onNext(EmptyStateReason.noInternet)
            return
        }
        fetchCommits()
    }
    
    private func fetchCommits() {
        let apiClient = ApiClient()
        apiClient.getGitHubCommits(params: [:]) { [weak self] result in
            switch result {
            case .success(let commits):
                self?.rx_commits.accept(commits)
                if commits.count == 0 {
                    self?.rx_setEmptyStateViewVisiblity.onNext(EmptyStateReason.noCommit)
                }
            case .failure(let error):
                print(error.localizedDescription)
                self?.rx_setEmptyStateViewVisiblity.onNext(EmptyStateReason.fetchError(error.localizedDescription))
            }
        }
    }
    
    deinit {
        disposeBag = nil
        print(#function, String(describing: CommitListViewModel.self))
    }
    
}
