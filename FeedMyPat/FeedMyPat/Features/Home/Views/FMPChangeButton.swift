//
//  FMPChangeButton.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 22.04.21.
//

import UIKit

class FMPChangeButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupData() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }

}
