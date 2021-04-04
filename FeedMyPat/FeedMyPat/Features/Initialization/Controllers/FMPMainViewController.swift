//
//  FMPMainViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 31.03.21.
//

import UIKit
import SnapKit

class FMPMainViewController: UIViewController {

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: UIControl.State())
        button.setTitleColor(.white, for: UIControl.State())
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .brown

        self.view.addSubview(nextButton)

        self.nextButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(50)
            make.left.right.equalToSuperview().inset(25)
            make.height.equalTo(60)
        }
    }
    @objc func nextButtonTapped() {

        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(FMPTabBarViewController())
        }
    }
}
