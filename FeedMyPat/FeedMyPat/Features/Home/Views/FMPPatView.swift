//
//  FMPPatView.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 21.04.21.
//

import UIKit

class FMPPatView: UIView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 12, height: 12)
        layer.shadowRadius = 12
        layer.shadowOpacity = 12
        layer.cornerRadius = 3
    }
    }
