//
//  Commit.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

struct Commit: Codable {
    var author: Author?
    var committer: Committer?
    var message: String?
    var tree: Tree?
    var url: String?
    var commentCount: Int?
    var verification: Verification?
    
    enum CodingKeys: String, CodingKey {
        case author
        case committer
        case message
        case tree
        case url
        case commentCount = "comment_count"
        case verification
    }
}
