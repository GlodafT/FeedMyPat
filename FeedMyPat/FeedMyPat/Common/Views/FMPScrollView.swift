//
//  FMPScrollView.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 3.05.21.
//

import UIKit

class FMPScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        showsVerticalScrollIndicator = false
        contentInsetAdjustmentBehavior = .never
        backgroundColor = .clear
    }
    }
