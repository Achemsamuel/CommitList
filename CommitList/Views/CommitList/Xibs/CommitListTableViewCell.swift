//
//  CommitListTableViewCell.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import UIKit

final class CommitListTableViewCell: UITableViewCell {

    private var row: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewElements()
    }

    fileprivate func setupViewElements() {
    
    }
    
    func configureView(_ commitVM: CommitVM, _ row: Int) {
        self.row = row
    }
    
}
