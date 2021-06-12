//
//  FMPMainViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 31.03.21.
//

import UIKit
import SnapKit

class FMPMainViewController: UIViewController {

    private lazy var patIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "tabBarMyPatsIcon")
        icon.translatesAutoresizingMaskIntoConstraints = false

        return icon
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        self.view.addSubview(self.patIcon)

        self.animatePatIcon()
    }

    override func updateViewConstraints() {
        self.patIcon.snp.updateConstraints { (make) in
            make.height.width.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        super.updateViewConstraints()
    }

    private func animatePatIcon() {
        UIView.animate(withDuration: 1.5, delay: 0,
                       usingSpringWithDamping: 1.0, initialSpringVelocity: 0.7,
                       options: .showHideTransitionViews) {
            self.patIcon.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

            UIView.animate(withDuration: 1.0, delay: 1.0,
                           usingSpringWithDamping: 0.2, initialSpringVelocity: 1,
                           options: .curveEaseInOut) {
                self.patIcon.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

            }
                       }
        Timer.scheduledTimer(withTimeInterval: 1.9, repeats: false) { (_) in
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.changeRootViewController(FMPTabBarViewController())
        }
    }

}
}
