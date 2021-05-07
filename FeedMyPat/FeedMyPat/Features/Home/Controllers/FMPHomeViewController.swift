//
//  FMPHomeViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import UIKit
import SnapKit
import RealmSwift

class FMPHomeViewController: UIViewController {

    // MARK: - gui variables

    var flag: Bool = true               /// testing

    let realm = FMPRealmManager.safeRealm
    lazy var mainData: Results<FMPPatModel> = { self.realm.objects(FMPPatModel.self)}()

    lazy var patView: UIView = FMPPatView()

    private lazy var petViewLeftButton: UIButton = {
        let button = FMPChangeButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.addTarget(self, action: #selector(leftRightButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var petViewRightButton: UIButton = {
        let button = FMPChangeButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.addTarget(self, action: #selector(leftRightButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var mainScrollView: UIScrollView = FMPScrollView()

    private lazy var medicatButton: FMPMainButton = {
        let button = FMPMainButton()
        button.addTarget(self, action: #selector(medicatButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("MediCat", for: UIControl.State())

        return button
    }()

    private lazy var vaccineButton: FMPMainButton = {
        let button = FMPMainButton()
        button.addTarget(self, action: #selector(vaccineButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Vaccine", for: UIControl.State())

        return button
    }()

    private lazy var documentsButton: FMPMainButton = {
        let button = FMPMainButton()
        button.addTarget(self, action: #selector(documentsButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Documents", for: UIControl.State())

        return button
    }()

    private lazy var certificateButton: FMPMainButton = {
        let button = FMPMainButton()
        button.addTarget(self, action: #selector(certificateButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.setTitle("Certificate", for: UIControl.State())

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .init(white: 0.9, alpha: 1)

        self.view.addSubviews([patView,
                               mainScrollView])
        self.mainScrollView.addSubviews([medicatButton,
                                         vaccineButton,
                                         documentsButton,
                                         certificateButton])
        self.patView.addSubviews([petViewLeftButton,
                                  petViewRightButton])

        //        self.isExistAnimal()
    }

    // MARK: - Constraints

    override func updateViewConstraints() {
        let boundsOfButtons = self.view.bounds.width - 70

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

        self.mainScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.patView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }

        self.medicatButton.snp.makeConstraints { (make) in
            make.width.equalTo(boundsOfButtons)
            make.left.right.equalToSuperview().inset(35)
            make.top.equalToSuperview().offset(50)

        }

        self.vaccineButton.snp.makeConstraints { (make) in
            make.width.equalTo(boundsOfButtons)
            make.left.equalToSuperview().inset(35)
            make.right.equalToSuperview().inset(35)
            make.top.equalTo(self.medicatButton.snp.bottom).offset(15)

        }

        self.documentsButton.snp.makeConstraints { (make) in
            make.width.equalTo(boundsOfButtons)
            make.left.right.equalToSuperview().inset(35)
            make.top.equalTo(self.vaccineButton.snp.bottom).offset(15)
        }

        self.certificateButton.snp.makeConstraints { (make) in
            make.width.equalTo(boundsOfButtons)
            make.left.right.equalToSuperview().inset(35)
            make.top.equalTo(self.documentsButton.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(50)
        }

        super.updateViewConstraints()
    }

    // MARK: - Functions

    private func isExistAnimal() {
            UIButton.animate(withDuration: 2) {
                self.medicatButton.backgroundColor = .init(white: 1, alpha: 0.4)
                self.vaccineButton.backgroundColor = .init(white: 1, alpha: 0.4)
                self.documentsButton.backgroundColor = .init(white: 1, alpha: 0.4)
                self.certificateButton.backgroundColor = .init(white: 1, alpha: 0.4)
                UIButton.animate(withDuration: 3, delay: 0.7) {
                    self.medicatButton.backgroundColor = .init(white: 0.9, alpha: 1)
                    self.vaccineButton.backgroundColor = .init(white: 0.9, alpha: 1)
                    self.documentsButton.backgroundColor = .init(white: 0.9, alpha: 1)
                    self.certificateButton.backgroundColor = .init(white: 0.9, alpha: 1)
                }
            }

            var alert: UIAlertController {
                let alert = UIAlertController(title: "Pls Add Animal))",
                                              message: "Smthnk about adding animal",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: {_ in
                                                self.navigationController?.present(FMPAddPatViewController(), animated: true)
                                              }))
                alert.addAction(UIAlertAction(title: "Cancel",
                                              style: .destructive,
                                              handler: nil))

                return alert
            }
                self.present(alert, animated: true)
    }

    // MARK: - Objc functions

    @objc private func leftRightButtonTapped() {                    /// testing         |||         change
        if flag {
            self.view.backgroundColor = .blue
            flag.toggle()
        } else {
            self.view.backgroundColor = .white
            flag.toggle()
        }
    }

    @objc private func medicatButtonTapped() {
        guard !mainData.isEmpty else { isExistAnimal(); return }
        let controller = FMPMedicatViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @objc private func vaccineButtonTapped() {
        guard !mainData.isEmpty else { isExistAnimal(); return }
        self.navigationController?.pushViewController(FMPVaccineViewController(), animated: true)
    }

    @objc private func documentsButtonTapped() {
        guard !mainData.isEmpty else { isExistAnimal(); return }
        self.navigationController?.pushViewController(FMPDocumentsViewController(), animated: true)
    }

    @objc private func certificateButtonTapped() {
        guard !mainData.isEmpty else { isExistAnimal(); return }
        self.navigationController?.pushViewController(FMPCertificateViewController(), animated: true)
    }

}
