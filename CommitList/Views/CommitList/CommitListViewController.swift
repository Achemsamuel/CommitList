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
    private(set) var refreshControl: UIRefreshControl?
    
    @IBOutlet weak private(set) var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        initialSetup()
        setupEmptyStateObserver()
    }
    
    private func setupViewModel() {
        viewModel = CommitListViewModel()
    }
    
    private func initialSetup() {
        disposeBag = DisposeBag()
        refreshControl = UIRefreshControl()
        setupTableView()
        self.title = Constants.recentCommits
    }
    
    private func setupTableView() {
        tableView.refreshControl = refreshControl
        tableView.refreshControl?.beginRefreshing()
        refreshControl?.addTarget(self, action: #selector(didBeginRefreshing), for: .valueChanged)
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: CommitListTableViewCell.NIB_NAME, bundle: nil), forCellReuseIdentifier: CommitListTableViewCell.Identifier)
        
        viewModel?.rx_commits.bind(to: tableView.rx.items(cellIdentifier: CommitListTableViewCell.Identifier, cellType: CommitListTableViewCell.self)) {
            [weak self] (row, commit, cell) in
            self?.tableView.refreshControl?.endRefreshing()
            cell.configureView(commit.toCommitVM(), row)
        }.disposed(by: disposeBag)
    }
    
    private func setupEmptyStateObserver() {
        viewModel?.rx_setEmptyStateViewVisiblity.asObservable().subscribe(onNext: { [weak self] emptyStateReason in
            switch emptyStateReason {
            case .fetchError(let error):
                self?.tableView.setEmptyView(message: error, imageSize: 170)
            case .noCommit:
                self?.tableView.setEmptyView(message: Constants.noCommits, imageSize: 170)
            case .noInternet:
                self?.tableView.setEmptyView(message: Constants.noInternet, imageSize: 170)
            }
            self?.tableView.refreshControl?.endRefreshing()
        }).disposed(by: disposeBag)
    }
    
    @objc func didBeginRefreshing() {
        viewModel?.fetchDataOnLoad()
    }
    
    deinit {
        disposeBag = nil
        print(#function, String(describing: CommitListViewController.self))
    }
}
