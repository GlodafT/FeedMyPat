//
//  FMPAddPatViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 15.04.21.
//

import UIKit
import SnapKit
import RealmSwift

protocol FMPAddPatViewControllerDelegate: class {
    func passData()
}

class FMPAddPatViewController: FMPViewController {

    let realm = FMPRealmManager.safeRealm

    weak var delegate: FMPAddPatViewControllerDelegate?

    // MARK: - Private Properties

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Save ", for: UIControl.State())
        button.setTitleColor(.systemGreen, for: UIControl.State())
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)

        return button
    }()

    private lazy var nameLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Name:"
        return label
    }()

    private lazy var nameTextFieldDescription = FMPGrayCornerTextField()

    private lazy var dateOfBirthLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Date of Birth:"
        return label
    }()

    private lazy var dateOfBirthTextFieldDescription: UITextField = {
        let text = FMPGrayCornerTextField()
        text.inputView = self.datePicker
        text.inputAccessoryView = self.doneToollBar
        return text
    }()

    private lazy var typeLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Type:"
        return label
    }()

    private lazy var typeTextFieldDescription = FMPGrayCornerTextField()

    private lazy var breedLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Breed:"

        return label
    }()

    private lazy var breedTextFieldDescription = FMPGrayCornerTextField()

    private lazy var genderLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Gender:"
        return label
    }()

    private lazy var genderSegmentedControlDescription: UISegmentedControl = {
        var segments = ["Male", "Female"]
        let control = UISegmentedControl(items: segments )
        control.selectedSegmentTintColor = .systemGreen
        control.translatesAutoresizingMaskIntoConstraints = false

        return control
    }()

    private lazy var colorLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Color:"
        return label
    }()

    private lazy var colorTextFieldDescription = FMPGrayCornerTextField()

    private lazy var sterilizationLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Sterilization:"
        return label
    }()

    private lazy var sterilizationSwitchDescription: UISwitch = {
        let swich = UISwitch()
        swich.onTintColor = .systemGreen
        swich.translatesAutoresizingMaskIntoConstraints = false
        return swich
    }()

    private lazy var chipLabel: UILabel = {
        let label = FMPMediumlabelView()
        label.text = "Chip:"

        return label
    }()

    private lazy var chipTextFieldDescription = FMPGrayCornerTextField()

    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        picker.translatesAutoresizingMaskIntoConstraints = false

        picker.addTarget(self, action: #selector(self.valueChanged), for: .valueChanged)

        return picker
    }()

    private lazy var doneToollBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        ]
        toolbar.sizeToFit()

        return toolbar
    }()

    // MARK: - Lifecycle

    override func initController() {
        super.initController()
        self.setContentScrolling(isEnabled: false)

        self.mainView.addSubviews([
            self.saveButton,
            self.nameLabel,
            self.nameTextFieldDescription,
            self.dateOfBirthLabel,
            self.dateOfBirthTextFieldDescription,
            self.typeLabel,
            self.typeTextFieldDescription,
            self.breedLabel,
            self.breedTextFieldDescription,
            self.genderLabel,
            self.genderSegmentedControlDescription,
            self.colorLabel,
            self.colorTextFieldDescription,
            self.sterilizationLabel,
            self.sterilizationSwitchDescription,
            self.chipLabel,
            self.chipTextFieldDescription
        ])

        self.addGesture()

    }

    // MARK: - Constraints

    override func updateViewConstraints() {
        self.saveButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(15)
            make.right.equalToSuperview().inset(20)
        }

        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.saveButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
        }

        self.nameTextFieldDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
        }

        self.dateOfBirthLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameTextFieldDescription.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }

        self.dateOfBirthTextFieldDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameTextFieldDescription.snp.bottom).offset(5)
            make.left.greaterThanOrEqualTo(self.dateOfBirthLabel.snp.right)
            make.right.equalToSuperview().inset(30)
            make.width.equalTo(110)
        }

        self.typeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.dateOfBirthLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }

        self.typeTextFieldDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
        }

        self.breedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.typeTextFieldDescription.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }

        self.breedTextFieldDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.breedLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
        }

        self.genderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.breedTextFieldDescription.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }

        self.genderSegmentedControlDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.breedTextFieldDescription.snp.bottom).offset(5)
            make.left.greaterThanOrEqualTo(self.genderLabel.snp.right)
            make.right.equalToSuperview().inset(30)
        }

        self.colorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.genderLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }

        self.colorTextFieldDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.colorLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
        }

        self.sterilizationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.colorTextFieldDescription.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }

        self.sterilizationSwitchDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.colorTextFieldDescription.snp.bottom).offset(5)
            make.left.greaterThanOrEqualTo(self.colorLabel.snp.right)
            make.right.equalToSuperview().inset(30)
        }

        self.chipLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sterilizationLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }

        self.chipTextFieldDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.chipLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(30)
        }

        super.updateViewConstraints()
    }

    // MARK: - Private Methods

    private func addGesture() {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(tapRecognizer))

        self.mainView.addGestureRecognizer(recognizer)
    }

    private func sterilizationToString(swich: UISwitch) -> String {
        if swich.isOn {
            return "Yes"
        } else {
            return "No"
        }
    }

    private func selectSegmentDescription(segment: UISegmentedControl) -> String {
        if segment.selectedSegmentIndex == 0 {
            return "Male"
        } else {
            return "Female"
        }
    }

    // MARK: - Objc Private Methods

    @objc private func saveButtonTapped() {
        guard nameTextFieldDescription.text != "",
              dateOfBirthTextFieldDescription.text != "",
              typeTextFieldDescription.text != "",
              breedTextFieldDescription.text != "",
              genderSegmentedControlDescription.isEnabled,
              colorTextFieldDescription.text != "",
              chipTextFieldDescription.text != "" else {return}

        let patData: FMPPatModel = FMPPatModel.init(
            name: nameTextFieldDescription.text ?? "error",
            date: dateOfBirthTextFieldDescription.text ?? "error",
            type: typeTextFieldDescription.text ?? "error",
            breed: breedTextFieldDescription.text ?? "error",
            gender: selectSegmentDescription(segment: genderSegmentedControlDescription),
            color: colorTextFieldDescription.text ?? "error",
            sterilization: sterilizationToString(swich: sterilizationSwitchDescription),
            chip: chipTextFieldDescription.text ?? "error")

        FSP.selectPatId = patData.id

        FMPRealmManager.write(realm: realm, writeClosure: {
            realm.add(patData)
        })
        delegate?.passData()

        self.dismiss(animated: true, completion: nil)
    }

    @objc private func valueChanged(sender: UIDatePicker) {
        self.dateOfBirthTextFieldDescription.text = sender.date.toString()
    }

    @objc private func doneTapped() {
        self.dateOfBirthTextFieldDescription.resignFirstResponder()
    }

    @objc private func tapRecognizer() {
        self.mainView.endEditing(true)
        resignFirstResponder()

}
}
