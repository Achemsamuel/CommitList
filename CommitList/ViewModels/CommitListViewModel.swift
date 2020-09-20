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
    private(set) var rx_receipts: BehaviorRelay<[CommitResponse]> = BehaviorRelay(value: [])
    private(set) var rx_setEmptyStateViewVisiblity: PublishSubject<Bool> = PublishSubject()
    
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
            self.rx_setEmptyStateViewVisiblity.onNext(true)
            return
        }
        fetchCommits()
    }
    
    private func fetchCommits() {
        
    }
    
    deinit {
        disposeBag = nil
        print(#function, String(describing: CommitListViewModel.self))
    }
    
}
