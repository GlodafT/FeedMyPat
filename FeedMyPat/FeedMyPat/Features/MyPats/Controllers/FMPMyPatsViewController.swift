//
//  FMPMyPatsViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import UIKit
import SnapKit

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

    var flag: Bool = true

//    private lazy var addPatId: UUID = UUID()

    lazy var patModel = FMPMainAnimalData.sh.animals

//    lazy var patModel: [Animal] = []
//
//    func set(vaccines: [Vaccine]) {
//
//    }

    let patView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 12, height: 12)
        view.layer.shadowRadius = 12
        view.layer.shadowOpacity = 12
        view.layer.cornerRadius = 3
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

    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"

        return label
    }()

    var nameLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date of Birth:"
        return label
    }()

    var dateOfBirthLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type:"
        return label
    }()

    var typeLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var breedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Breed:"
        return label
    }()

    var breedLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender:"
        return label
    }()

    var genderLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var colorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color:"
        return label
    }()

    var colorLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var sterilizationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sterilization:"
        return label
    }()

    var sterilizationLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var chipLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chip:"
        return label
    }()

    var chipLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var rightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    var leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()

    private lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonTapped))

    override func initController() {
        super.initController()

        self.leftStackView.addArrangedSubviews([
            nameLabel,
            dateOfBirthLabel,
            typeLabel,
            breedLabel,
            genderLabel,
            colorLabel,
            sterilizationLabel,
            chipLabel
        ])

        self.rightStackView.addArrangedSubviews([
            nameLabelDescription,
            dateOfBirthLabelDescription,
            typeLabelDescription,
            breedLabelDescription,
            genderLabelDescription,
            colorLabelDescription,
            sterilizationLabelDescription,
            chipLabelDescription
        ])

//        self.addPatController.delegate = self.myPatsController

        self.view.backgroundColor = .systemRed
        self.view.addSubview(patView)
        self.mainView.addSubviews([ rightStackView, leftStackView])
        self.patView.addSubviews([petViewLeftButton, petViewRightButton])
        self.setDescriptionToLabelDescription(setId: FMPMainAnimalData.sh.selectPatId)
        self.navigationItem.setRightBarButton(self.addButton, animated: true)

    }

    override func updateViewConstraints() {

        self.patView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.mainView.snp.top)
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
            make.top.equalTo(self.mainView.snp.top).offset(20)
            make.left.equalToSuperview().inset(30)
//            make.bottom.equalToSuperview()
//            make.height.equalTo(500)
        }

        self.rightStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainView.snp.top).offset(20)
            make.left.greaterThanOrEqualTo(self.leftStackView.snp.right)
            make.right.equalToSuperview().inset(30)
//            make.bottom.equalToSuperview()

//            make.height.equalTo(500)

        }

            super.updateViewConstraints()
    }

    // исправить!

    private func setDescriptionToLabelDescription(setId: UUID) {
        for pat in FMPMainAnimalData.sh.animals {
            if pat.id == setId {
                nameLabelDescription.text = pat.nameLabelDescription
                dateOfBirthLabelDescription.text = pat.dateOfBirthLabelDescription
                typeLabelDescription.text = pat.typeLabelDescription
                breedLabelDescription.text = pat.breedLabelDescription
                genderLabelDescription.text = pat.genderLabelDescription
                colorLabelDescription.text = pat.colorLabelDescription
                sterilizationLabelDescription.text = pat.sterilizationLabelDescription
                chipLabelDescription.text = pat.chipLabelDescription
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
        controller.set(data: [""])
        self.navigationController?.present(controller, animated: true)
    }

}

extension FMPMyPatsViewController: FMPAddPatViewControllerDelegate {
    func passData(model: FMPPatModel) {
        patModel.append(model)
        FMPMainAnimalData.sh.animals.append(model)
        FMPMainAnimalData.sh.selectPatId = model.id
        self.setDescriptionToLabelDescription(setId: model.id)
    }

}
