//
//  UiView+Ex.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 7.04.21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
