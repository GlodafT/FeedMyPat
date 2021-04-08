//
//  FMPMyPatsViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import UIKit
import SnapKit

class FMPMyPatsViewController: UIViewController {

    var flag: Bool = true

    let patView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 12, height: 12)
        view.layer.shadowRadius = 12
        view.layer.shadowOpacity = 12
        view.layer.cornerRadius = 3
//        view.isUserInteractionEnabled = true
        return view
    }()

    let petViewLeftButton: UIButton = {
        let button = UIButton()

        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(leftRightButtonTapped), for: .touchUpInside)

        return button
    }()

    let petViewRightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(leftRightButtonTapped), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(patView)
        self.patView.addSubview(petViewLeftButton)
        self.patView.addSubview(petViewRightButton)

        self.patView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(self.view.bounds.height / 4)
        }

        self.petViewLeftButton.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(self.view.bounds.width / 6)

        }

        self.petViewRightButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(self.view.bounds.width / 6)
        }

    }

    @objc private func leftRightButtonTapped() {
        if flag {
            self.view.backgroundColor = .systemBlue
            flag.toggle()
        } else {
            self.view.backgroundColor = .white
            flag.toggle()
        }
    }

}
