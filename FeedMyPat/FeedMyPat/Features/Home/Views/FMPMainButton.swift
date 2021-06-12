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
        contentEdgeInsets = .zero
    }
}
