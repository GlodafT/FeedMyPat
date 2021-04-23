//
//  FMPMediumlabelView.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 22.04.21.
//

import UIKit

class FMPMediumlabelView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupData() {
        textColor = .systemGray2
        font = UIFont.systemFont(ofSize: 20)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
