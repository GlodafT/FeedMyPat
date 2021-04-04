//
//  FMPMedicatViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 4.04.21.
//

import UIKit

class FMPMedicatViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true

    }

}
