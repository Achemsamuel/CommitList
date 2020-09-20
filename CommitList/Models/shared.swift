//
//  shared.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

enum EmptyStateReason {
    case noInternet
    case noCommit
    case fetchError(String)
}
