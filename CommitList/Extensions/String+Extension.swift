//
//  String+Extension.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import Foundation

extension String {
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        guard let date = dateFormatter.date(from: self) else {return ""}
        return dateFormatter.string(from: date)
    }

}
