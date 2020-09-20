//
//  Committer.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

struct Committer: Codable {
    var login: String?
    var id: Int?
    var nodeId: String?
    var avatarUrl: String?
    var gravatarId: String?
    var url: String?
    var htmlUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistUrl: String?
    var starredUrl: String?
    var reposUrl: String?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case url
        case gravatarId = "gravatar_id"
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistUrl = "gists_url"
        case starredUrl = "starred_url"
        case reposUrl = "repos_url"
        case type
    }
}
