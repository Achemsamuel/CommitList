//
//  CommitResponse.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

struct CommitResponse: Codable {
    var sha: String?
    var nodeId: String?
    var commit: Commit?
    var url: String?
    var htmlUrl: String?
    var commentsUrl: String?
    var author: Author?
    var committer: Committer?
    var parents: [Parents]?
    
    enum CodingKeys: String, CodingKey {
        case sha
        case nodeId = "node_id"
        case commit
        case url
        case htmlUrl = "html_url"
        case commentsUrl = "comments_url"
        case author
        case committer
        case parents
    }
}
