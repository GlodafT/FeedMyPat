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

        self.setViewControllers([homeViewController,
                                             patsViewController,
                                             inDevelopingViewController,
                                             mapViewController,
                                             settingsViewController], animated: true)
        

        self.tabBar.layer.borderColor = .init(gray: 1, alpha: 0.9)
        self.tabBar.layer.borderWidth = 1
    }

}
