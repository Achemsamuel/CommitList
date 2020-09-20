//
//  CommitListTableViewCell.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import UIKit
import SDWebImage

final class CommitListTableViewCell: UITableViewCell {

    private var row: Int = 0
    
    @IBOutlet weak private(set) var commitListCellContentView: UIView!
    @IBOutlet weak private(set) var date: UILabel!
    @IBOutlet weak private(set) var verifiedTag: UILabel!
    @IBOutlet weak private(set) var userName: UILabel!
    @IBOutlet weak private(set) var dateView: UIView!
    @IBOutlet weak private(set) var userView: UIView!
    @IBOutlet weak private(set) var authorImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewElements()
    }

    fileprivate func setupViewElements() {
        commitListCellContentView.layer.cornerRadius = 8
        userView.layer.cornerRadius = 8
        dateView.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], cornerRadius: 9)
        authorImage.layer.cornerRadius = authorImage.frame.width/2
    }
    
    func configureView(_ commitVM: CommitVM, _ row: Int) {
        self.row = row
        authorImage.sd_imageIndicator = sd_imageIndicator
        authorImage.sd_setImage(with: commitVM.authorImageUrl, placeholderImage: nil, options: .retryFailed)
        userName.text = commitVM.authorName
        date.text = commitVM.date
        verifiedTag.text = "Verified: \(commitVM.verified)"
    }
    
}
