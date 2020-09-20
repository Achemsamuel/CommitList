//
//  Verification.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

struct Verification: Codable {
    var verified: Bool?
    var reason: String?
    var signature: String?
    var payload: String?
}
