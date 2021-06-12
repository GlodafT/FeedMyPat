//
//  SceneDelegate.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 31.03.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = scene as? UIWindowScene else { return }
        let window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene

        window.rootViewController = UINavigationController(rootViewController: FMPMainViewController())
        self.window = window

        self.setupNavBarAppearance()

        window.makeKeyAndVisible()
    }

    func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.gray]

        UINavigationBar.appearance().standardAppearance = navBarAppearance

        let buttonStyle = UIBarButtonItemAppearance(style: .plain)
        buttonStyle.normal.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        navBarAppearance.buttonAppearance = buttonStyle

    }

    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }
        window.rootViewController = vc

        if animated {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionFlipFromLeft,
                              animations: nil)
        }
    }

    func presentViewController(vc: UIViewController) {
        self.window?.rootViewController?.present(vc, animated: true, completion: nil)
    }

}
