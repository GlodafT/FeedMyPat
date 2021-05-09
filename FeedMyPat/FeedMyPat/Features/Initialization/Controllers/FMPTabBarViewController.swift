//
//  FMPTabBarViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import UIKit

class FMPTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = FMPHomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabBarHomeIcon"), tag: 0)

        let patsViewController = FMPMyPatsViewController()
        patsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabBarMyPatsIcon"), tag: 1)

        let inDevelopingViewController = FMPInDevelopingViewController()
        //        inDevelopingViewController.tabBarItem = UITabBarItem(title: <#T##String?#>, image: <#T##UIImage?#>, tag: <#T##Int#>)

        let mapViewController = FMPMapViewController()
        mapViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabBarMapIcon"), tag: 2)

        let settingsViewController = FMPSettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabBarSettingsIcon"), tag: 3)

        self.setViewControllers([
            UINavigationController(rootViewController: homeViewController),
            UINavigationController(rootViewController: patsViewController),
            UINavigationController(rootViewController: inDevelopingViewController),
            UINavigationController(rootViewController: mapViewController),
            UINavigationController(rootViewController: settingsViewController)
        ], animated: true)
        self.setTabbarAppereance()
    }

    func setTabbarAppereance() {
        self.tabBar.layer.borderColor = .init(gray: 1, alpha: 0.9)
        self.tabBar.layer.borderWidth = 1
        self.tabBar.itemPositioning = .centered
        self.tabBar.tintColor = .systemGreen
        self.tabBar.unselectedItemTintColor = .systemGray
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = self.tabBar.items?.firstIndex(of: item),
              let imageView = tabBar.subviews[index + 1].subviews.first as? UIImageView else {
            return
        }
        UIView.animate(withDuration: 0.8, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .curveEaseIn) {
            imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

            UIView.animate(withDuration: 0.8, delay: 0.2,
                           usingSpringWithDamping: 1, initialSpringVelocity: 1,
                           options: .curveEaseOut) {
                imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }

}
