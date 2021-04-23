//
//  FMPMyPatsViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import UIKit
import SnapKit
import RealmSwift

class FMPMyPatsViewController: FMPViewController {

//    struct Animal {
//        let name: String
//        let id: UUID
//
//        let document: [Document]
//        let vaccine: [Vaccine]
//    }
//
//    struct Document {
//        let name: String
//        let date: Date
//    }
//
//    struct Vaccine {
//        let name: String
//        let date: Date
//    }

    var flag: Bool = true                       /// delite

//    private lazy var addPatId: UUID = UUID()

//    lazy var mainData = FMAD()


    let realm = try! Realm()
    lazy var mainData: Results<FMAD> = { self.realm.objects(FMAD)}()



    let patView: UIView = FMPPatView()

    let petViewLeftButton: UIButton = {
        let button = FMPChangeButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.addTarget(self, action: #selector(leftRightButtonTapped), for: .touchUpInside)
        return button
    }()

    let petViewRightButton: UIButton = {
        let button = FMPChangeButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.addTarget(self, action: #selector(leftRightButtonTapped), for: .touchUpInside)
        return button
    }()

    var nameLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Name:"
        return label
    }()

    var nameLabelDescription = FMPMediumlabelView()

    var dateOfBirthLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Date of Birth:"
        return label
    }()

    var dateOfBirthLabelDescription = FMPMediumlabelView()

    var typeLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Type:"
        return label
    }()

    var typeLabelDescription = FMPMediumlabelView()

    var breedLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Breed:"
        return label
    }()

    var breedLabelDescription = FMPMediumlabelView()

    var genderLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Gender:"
        return label
    }()

    var genderLabelDescription = FMPMediumlabelView()

    var colorLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Color:"
        return label
    }()

    var colorLabelDescription = FMPMediumlabelView()

    var sterilizationLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Sterilization:"
        return label
    }()

    var sterilizationLabelDescription = FMPMediumlabelView()

    var chipLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Chip:"
        return label
    }()

    var chipLabelDescription = FMPMediumlabelView()

    var rightStackView = FMPStackView()

    var leftStackView = FMPStackView()

    private lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonTapped))

    override func initController() {
        super.initController()

        self.leftStackView.addArrangedSubviews([nameLabel,
                                                dateOfBirthLabel,
                                                typeLabel,
                                                breedLabel,
                                                genderLabel,
                                                colorLabel,
                                                sterilizationLabel,
                                                chipLabel])

        self.rightStackView.addArrangedSubviews([nameLabelDescription,
                                                 dateOfBirthLabelDescription,
                                                 typeLabelDescription,
                                                 breedLabelDescription,
                                                 genderLabelDescription,
                                                 colorLabelDescription,
                                                 sterilizationLabelDescription,
                                                 chipLabelDescription])

        self.view.backgroundColor = .systemRed
        self.mainView.addSubviews([patView, rightStackView, leftStackView])
        self.patView.addSubviews([petViewLeftButton, petViewRightButton])
        self.setDescriptionToLabelDescription(setId: mainData.selectPatId)
        self.navigationItem.setRightBarButton(self.addButton, animated: true)
    }

    override func updateViewConstraints() {

        self.patView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
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

        self.leftStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.patView.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }

        self.rightStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.patView.snp.bottom).offset(20)
            make.left.greaterThanOrEqualTo(self.leftStackView.snp.right).offset(5)
            make.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }

            super.updateViewConstraints()
    }

    // исправить!

    private func setDescriptionToLabelDescription(setId: UUID) {
        for pat in mainData.animals {
            if pat.id == setId {
                self.nameLabelDescription.text = pat.nameLabelDescription
                self.dateOfBirthLabelDescription.text = pat.dateOfBirthLabelDescription
                self.typeLabelDescription.text = pat.typeLabelDescription
                self.breedLabelDescription.text = pat.breedLabelDescription
                self.genderLabelDescription.text = pat.genderLabelDescription
                self.colorLabelDescription.text = pat.colorLabelDescription
                self.sterilizationLabelDescription.text = pat.sterilizationLabelDescription
                self.chipLabelDescription.text = pat.chipLabelDescription
            }
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

    @objc private func addButtonTapped() {
        let controller = FMPAddPatViewController()
        controller.delegate = self
        self.navigationController?.present(controller, animated: true)
    }

}

extension FMPMyPatsViewController: FMPAddPatViewControllerDelegate {
    func passData(id: UUID, Data: FMPPatModel) {
        mainData.animals.append(Data)
        self.setDescriptionToLabelDescription(setId: id)
    }

}
