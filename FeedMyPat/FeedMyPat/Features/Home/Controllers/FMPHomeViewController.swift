//
//  FMPHomeViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import UIKit
import SnapKit

class FMPHomeViewController: UIViewController {

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

        button.setImage(UIImage(named: "arrow.backward"), for: UIControl.State())
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(medicatButtonTapped), for: .touchUpInside)

        return button
    }()

    let petViewRightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow.forward"), for: UIControl.State())
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(medicatButtonTapped), for: .touchUpInside)

        return button
    }()

    let medicatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("MediCat", for: UIControl.State())

        button.setTitleColor(.systemGray, for: UIControl.State())
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(medicatButtonTapped1), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 12, height: 12)
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 12
        button.layer.cornerRadius = 35
        button.contentEdgeInsets = .zero

        return button
    }()

    let vaccineButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Vaccine", for: UIControl.State())
        button.setTitleColor(.systemGray, for: UIControl.State())
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(medicatButtonTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 12, height: 12)
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 12
        button.layer.cornerRadius = 35
        button.contentEdgeInsets = .zero

        return button
    }()

    let DocumentsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Documents", for: UIControl.State())
        button.setTitleColor(.systemGray, for: UIControl.State())
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(medicatButtonTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 12, height: 12)
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 12
        button.layer.cornerRadius = 35
        button.contentEdgeInsets = .zero

        return button
    }()

    let CertificateButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Certificate", for: UIControl.State())
        button.setTitleColor(.systemGray, for: UIControl.State())
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(medicatButtonTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 12, height: 12)
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 12
        button.layer.cornerRadius = 35
        button.contentEdgeInsets = .zero

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .init(white: 15, alpha: 1)

        self.view.addSubview(patView)
        self.view.addSubview(medicatButton)
        self.view.addSubview(vaccineButton)
        self.view.addSubview(DocumentsButton)
        self.view.addSubview(CertificateButton)
        self.view.addSubview(petViewLeftButton)
        self.view.addSubview(petViewRightButton)

        self.patView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(self.view.bounds.height / 3)
        }

        self.petViewLeftButton.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.right.equalTo(self.patView.snp.left)
            make.width.equalTo(self.view.bounds.width / 6)
            make.height.equalTo(self.view.bounds.height / 3)
//            make.height.equalTo(self.patView.bounds.height)
        }

        self.petViewRightButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.patView.snp.right)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(self.view.bounds.width / 6)
            make.height.equalTo(self.view.bounds.height / 3)
//            make.height.equalTo(self.patView.bounds.height)
        }

        self.medicatButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(150)
            make.left.equalToSuperview().inset(35)
            make.top.equalTo(self.patView.snp.bottom).offset(50)

        }

        self.vaccineButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(150)
            make.left.equalTo(medicatButton.snp.right).inset(-25)
            make.top.equalTo(self.patView.snp.bottom).offset(50)
            make.right.equalToSuperview().inset(35)

        }

        self.DocumentsButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(150)
            make.left.equalToSuperview().inset(35)
            make.top.equalTo(medicatButton.snp.bottom).inset(-25)
        }

        self.CertificateButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(150)
            make.left.equalTo(DocumentsButton.snp.right).inset(-25)
            make.top.equalTo(vaccineButton.snp.bottom).inset(-25)
            make.right.equalToSuperview().inset(35)
        }

        updateViewConstraints()
    }

    @objc func medicatButtonTapped() {
        if flag {
            self.view.backgroundColor = .blue
            flag.toggle()
        } else {
            self.view.backgroundColor = .white
            flag.toggle()
        }
    }

    @objc func medicatButtonTapped1() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(FMPMedicatViewController())
        }
    }
}
