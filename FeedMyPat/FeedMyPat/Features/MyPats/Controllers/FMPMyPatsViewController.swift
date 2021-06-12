//
//  FMPMyPatsViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import UIKit
import SnapKit
import RealmSwift

class FMPMyPatsViewController: UIViewController {

    let realm = FMPRealmManager.safeRealm

    // MARK: - Private Properties

    private lazy var mainData: Results<FMPPatModel> = { self.realm.objects(FMPPatModel.self)}()

    private lazy var patView: UIView = FMPPatView()

    private lazy var petViewLeftButton: UIButton = {
        let button = FMPChangeButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var petViewRightButton: UIButton = {
        let button = FMPChangeButton()
        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var patViewNameLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()

    private lazy var mainScrolView: UIScrollView = FMPScrollView()

    private lazy var nameLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Name:"
        return label
    }()

    private lazy var nameLabelDescription = FMPMediumlabelView()

    private lazy var dateOfBirthLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Date of Birth:"
        return label
    }()

    private lazy var dateOfBirthLabelDescription = FMPMediumlabelView()

    private lazy var typeLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Type:"
        return label
    }()

    private lazy var typeLabelDescription = FMPMediumlabelView()

    private lazy var breedLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Breed:"
        return label
    }()

    private lazy var breedLabelDescription = FMPMediumlabelView()

    private lazy var genderLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Gender:"
        return label
    }()

    private lazy var genderLabelDescription = FMPMediumlabelView()

    private lazy var colorLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Color:"
        return label
    }()

    private lazy var colorLabelDescription = FMPMediumlabelView()

    private lazy var sterilizationLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Sterilization:"
        return label
    }()

    private lazy var sterilizationLabelDescription = FMPMediumlabelView()

    private lazy var chipLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Chip:"
        return label
    }()

    private lazy var chipLabelDescription = FMPMediumlabelView()

    private lazy var rightStackView = FMPStackView()

    private lazy var leftStackView: UIStackView = {
        let stack = FMPStackView()
        stack.contentMode = .right
        return stack
    }()

    private lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonTapped))
    private lazy var editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.editButtonTapped))

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubviews([patView, mainScrolView])
        self.patView.addSubviews([petViewLeftButton, petViewRightButton, patViewNameLabel])
        self.mainScrolView.addSubviews([ leftStackView, rightStackView ])

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

        self.observSelectPat()
        self.navigationItem.title = "My Pat"
        self.view.backgroundColor = .systemRed
        self.setDescriptionToLabelDescription(setId: FSP.selectPatId)
        self.navigationItem.setRightBarButtonItems([self.addButton, self.editButton], animated: true)
        self.navigationController?.navigationBar.tintColor = .systemGreen
    }

    // MARK: - Constraints

    override func updateViewConstraints() {

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

        self.patViewNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }

        self.mainScrolView.snp.makeConstraints { (make) in
            make.top.equalTo(self.patView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }

        self.leftStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.left.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(30)
        }

        self.rightStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.left.greaterThanOrEqualTo(self.leftStackView.snp.right).offset(20)
            make.right.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(30)
        }

            super.updateViewConstraints()
    }

    // MARK: - Private Methods

    private func setDescriptionToLabelDescription(setId: String) {
        for pat in self.mainData {
            if pat.id == setId {
                self.patViewNameLabel.text = pat.nameLabelDescription
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

    private func setNillToDescription() {
        if FSP.selectPatId == "" {
            self.patViewNameLabel.text = ""
            self.nameLabelDescription.text = ""
            self.dateOfBirthLabelDescription.text = ""
            self.typeLabelDescription.text = ""
            self.breedLabelDescription.text = ""
            self.genderLabelDescription.text = ""
            self.colorLabelDescription.text = ""
            self.sterilizationLabelDescription.text = ""
            self.chipLabelDescription.text = ""
        }
    }

    private func observSelectPat() {
        NotificationCenter.default.addObserver(self, selector: #selector(selectPatChange), name: Notification.Name("SelectPatChange"), object: nil)
    }

    private func showHidePetViewButtons() {
        if self.mainData.count > 1 {
            self.petViewLeftButton.isHidden = false
            self.petViewRightButton.isHidden = false
        } else {
            self.petViewLeftButton.isHidden = true
            self.petViewRightButton.isHidden = true
        }
    }

    // MARK: - Objc Private Methods

    @objc private func editButtonTapped() {
        self.navigationController?.pushViewController(FMPAllPatsViewController(), animated: true)
    }

    @objc private func rightButtonTapped() {
        for object in self.mainData {
            if object.id == FSP.selectPatId {
                let indexOfLoadedPat = self.mainData.index(of: object)
                let indexOfNextPat = self.mainData.index(after: indexOfLoadedPat ?? 0)
                guard indexOfNextPat <= self.mainData.count - 1 else {return}
                FSP.selectPatId = self.mainData[indexOfNextPat].id
                self.setDescriptionToLabelDescription(setId: FSP.selectPatId)
            }
        }
    }

    @objc private func leftButtonTapped() {
        for object in self.mainData {
            if object.id == FSP.selectPatId {
                let indexOfLoadedPat = self.mainData.index(of: object)
                let indexOfNextPat = self.mainData.index(before: indexOfLoadedPat ?? 0)
                guard indexOfNextPat >= 0 else {return}
                FSP.selectPatId = self.mainData[indexOfNextPat].id
                self.setDescriptionToLabelDescription(setId: FSP.selectPatId)
            }
        }
    }

    @objc private func addButtonTapped() {
        let controller = FMPAddPatViewController()
        controller.delegate = self
        self.navigationController?.present(controller, animated: true)
    }

    @objc private func selectPatChange() {
        self.setDescriptionToLabelDescription(setId: FSP.selectPatId)
        self.showHidePetViewButtons()
    }

}

extension FMPMyPatsViewController: FMPAddPatViewControllerDelegate {
    func passData() {
        self.setDescriptionToLabelDescription(setId: FSP.selectPatId)
        self.showHidePetViewButtons()
    }

}
