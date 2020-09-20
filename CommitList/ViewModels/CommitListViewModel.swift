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
    
    override init() {
        super.init()
        initialSetup()
    }
    
    private func initialSetup() {
        disposeBag = DisposeBag()
    }
    
    deinit {
        disposeBag = nil
        print(#function)
    }
    
    
}
