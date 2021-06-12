//
//  FMPStackView.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 22.04.21.
//

import UIKit

class FMPStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupData()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupData() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 16
        translatesAutoresizingMaskIntoConstraints = false
    }
}
