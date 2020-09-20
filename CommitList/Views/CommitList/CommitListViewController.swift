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

    private(set) var disposeBag: DisposeBag!
    private(set) var viewModel: CommitListViewModel?
    
    @IBOutlet weak private(set) var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        initialSetup()
    }
    
    private func setupViewModel() {
        viewModel = CommitListViewModel()
    }
    
    private func initialSetup() {
        disposeBag = DisposeBag()
        setupTableView()
    }

    private func setupTableView() {
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    deinit {
        disposeBag = nil
        print(#function, String(describing: CommitListViewController.self))
    }
}
