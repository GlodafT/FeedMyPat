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

    let medicatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("MediCat", for: UIControl.State())

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

    let vaccineButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Vaccine", for: UIControl.State())
        button.setTitleColor(.systemGray, for: UIControl.State())
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(vaccineButtonTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 12, height: 12)
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 12
        button.layer.cornerRadius = 35
        button.contentEdgeInsets = .zero

        return button
    }()

    let documentsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Documents", for: UIControl.State())
        button.setTitleColor(.systemGray, for: UIControl.State())
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(documentsButtonTapped), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 12, height: 12)
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 12
        button.layer.cornerRadius = 35
        button.contentEdgeInsets = .zero

        return button
    }()

    let certificateButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Certificate", for: UIControl.State())
        button.setTitleColor(.systemGray, for: UIControl.State())
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(certificateButtonTapped), for: .touchUpInside)
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

//        self.navigationController?.navigationBar.isHidden = true

        self.view.addSubview(patView)
        self.view.addSubview(medicatButton)
        self.view.addSubview(vaccineButton)
        self.view.addSubview(documentsButton)
        self.view.addSubview(certificateButton)
        self.patView.addSubview(petViewLeftButton)
        self.patView.addSubview(petViewRightButton)

    }

//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        self.navigationController?.navigationBar.isHidden = false
//    }

    override func updateViewConstraints() {
        let boundsOfButtons = self.view.bounds.width / 5

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

//        self.medicatButton.snp.makeConstraints { (make) in
//            make.height.width.equalTo(boundsOfButtons)
//            make.left.equalToSuperview().inset(35)
//            make.top.equalTo(self.patView.snp.bottom).offset(50)
//
//        }
//
//        self.vaccineButton.snp.makeConstraints { (make) in
//            make.height.width.equalTo(boundsOfButtons)
//            make.left.equalTo(medicatButton.snp.right).inset(-25)
//            make.top.equalTo(self.patView.snp.bottom).offset(50)
//            make.right.equalToSuperview().inset(35)
//
//        }
//
//        self.DocumentsButton.snp.makeConstraints { (make) in
//            make.height.width.equalTo(boundsOfButtons)
//            make.left.equalToSuperview().inset(35)
//            make.top.equalTo(medicatButton.snp.bottom).inset(-25)
//        }
//
//        self.CertificateButton.snp.makeConstraints { (make) in
//            make.height.width.equalTo(boundsOfButtons)
//            make.left.equalTo(DocumentsButton.snp.right).inset(-25)
//            make.top.equalTo(vaccineButton.snp.bottom).inset(-25)
//            make.right.equalToSuperview().inset(35)
//        }

        self.medicatButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(boundsOfButtons)
            make.left.right.equalToSuperview().inset(35)
            make.top.equalTo(self.patView.snp.bottom).offset(50)

        }

        self.vaccineButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(boundsOfButtons)
            make.left.right.equalToSuperview().inset(35)
            make.top.equalTo(self.medicatButton.snp.bottom).offset(15)

        }

        self.documentsButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(boundsOfButtons)
            make.left.right.equalToSuperview().inset(35)
            make.top.equalTo(self.vaccineButton.snp.bottom).offset(15)
        }

        self.certificateButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(boundsOfButtons)
            make.left.right.equalToSuperview().inset(35)
            make.top.equalTo(self.documentsButton.snp.bottom).offset(15)
        }

        super.updateViewConstraints()
    }

    @objc private func leftRightButtonTapped() {
        if flag {
            self.view.backgroundColor = .blue
            flag.toggle()
        } else {
            self.view.backgroundColor = .white
            flag.toggle()
        }
    }

    @objc private func medicatButtonTapped() {
        self.navigationController?.pushViewController(FMPMedicatViewController(), animated: true)
    }

    @objc private func vaccineButtonTapped() {
        self.navigationController?.pushViewController(FMPVaccineViewController(), animated: true)
    }

    @objc private func documentsButtonTapped() {
        // поменять на документы
        self.navigationController?.pushViewController(FMPAddPatViewController(), animated: true)
    }

    @objc private func certificateButtonTapped() {
        // поменять на сертификат
        self.navigationController?.pushViewController(FMPMedicatAddViewController(), animated: true)
    }

}
