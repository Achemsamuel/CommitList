//
//  UIVIew+Extension.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: CACornerMask, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = corners
    }
}
