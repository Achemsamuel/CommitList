//
//  CommitVM.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

struct CommitVM {
    
    var authorName: String = ""
    var authorImageUrl: URL?
    var date: String = ""
    var verified: Bool = false
}

extension CommitResponse {
    
    func toCommitVM() -> CommitVM {
        var commitVM = CommitVM()
        commitVM.authorImageUrl = URL(string: committer?.avatarUrl ?? "")
        commitVM.authorName = commit?.author?.name ?? ""
        commitVM.date = commit?.author?.date?.toDateString() ?? ""
        commitVM.verified = commit?.verification?.verified ?? false
        
        return commitVM
    }
}
