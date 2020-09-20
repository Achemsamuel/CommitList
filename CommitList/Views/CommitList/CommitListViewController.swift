//
//  CommitListViewController.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class CommitListViewController: UIViewController {

    private var disposeBag: DisposeBag!
    
    @IBOutlet weak private(set) var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func initialSetup() {
        
    }
    
    private func setupObservers() {
        disposeBag = DisposeBag()
    }

    private func setupTableView() {
        
    }
    
    
    deinit {
        disposeBag = nil
    }
}
