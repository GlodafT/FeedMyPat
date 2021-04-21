//
//  FMPPatView.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 21.04.21.
//

import UIKit

class FMPPatView: UIView {

    lazy var patView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 12, height: 12)
        view.layer.shadowRadius = 12
        view.layer.shadowOpacity = 12
        view.layer.cornerRadius = 3
        return view
    }()

}
