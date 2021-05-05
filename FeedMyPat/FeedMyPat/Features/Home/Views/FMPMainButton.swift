//
//  FMPMainButton.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 22.04.21.
//

import UIKit

class FMPMainButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupData() {
        setTitleColor(.systemGray, for: UIControl.State())
        backgroundColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 30)
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 12, height: 12)
        layer.shadowRadius = 12
        layer.shadowOpacity = 12
        layer.cornerRadius = 35
        contentEdgeInsets = .init(top: 2, left: 10, bottom: 2, right: 3)
        contentHorizontalAlignment = .left
        imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
        titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
    }
}
