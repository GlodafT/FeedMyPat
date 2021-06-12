//
//  UiStackView+Ex.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 15.04.21.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
