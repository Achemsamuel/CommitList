//
//  UITableView+Extension.swift
//  CommitList
//
//  Created by Achem Samuel on 9/20/20.
//  Copyright © 2020 achemsamuel. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setEmptyView(title: String? = nil,
                      message: String? = nil,
                      attributedMessage: NSAttributedString? = nil,
                      image_: UIImage? = nil,
                      imageSize: CGFloat = 120, show: Bool? = false) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y,
                                             width: self.bounds.size.width,
                                             height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        let image = UIImageView()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        titleLabel.textColor = UIColor.black
        messageLabel.textColor = UIColor.lightGray
        image.image = image_
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(image)
        
        image.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -80).isActive = true
        image.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        image.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalToConstant: emptyView.frame.width - 20).isActive = true
        
        titleLabel.text = title
        titleLabel.tag = 1
        if let message = message {
            messageLabel.text = message
        } else if let attrMessage = attributedMessage {
            messageLabel.attributedText = attrMessage
        }
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.tag = 2
        
        UIView.animate(withDuration: 2, animations: {
            
            image.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (_) in
            UIView.animate(withDuration: 1, animations: {
                image.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (_) in
                UIView.animate(withDuration: 1, animations: {
                    image.transform = CGAffineTransform.identity
                })
            })
            
        })
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func restore(withSeparator: Bool = true) {
        self.backgroundView = nil
        self.separatorStyle = withSeparator ? .singleLine : .none
    }
}
