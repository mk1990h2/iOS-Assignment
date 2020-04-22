//
//  UIViewConstraint.swift
//  RainbowTabs
//
//  Created by 佐藤美佳 on 2020/04/22.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

extension UIView {
    func centerInSuperView() {
        if let superView = self.superview {
            self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        }
    }
}
