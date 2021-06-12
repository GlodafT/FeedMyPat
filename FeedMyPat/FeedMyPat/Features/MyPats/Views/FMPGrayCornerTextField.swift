//
//  FMPGrayCornerTextField.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 22.04.21.
//

import UIKit

class FMPGrayCornerTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupData() {
        backgroundColor = .systemGray4
        textColor = .systemGreen
        tintColor = .systemGreen
        font = UIFont.systemFont(ofSize: 18)
        borderStyle = .roundedRect
        translatesAutoresizingMaskIntoConstraints = false
    }
}
