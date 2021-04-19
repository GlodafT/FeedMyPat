//
//  FMPAddPatViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 15.04.21.
//

import UIKit
import SnapKit

protocol FMPAddPatViewControllerDelegate: class {
    func passData(name: String,
                  dateOfBirth: String,
                  type: String,
                  breed: String,
                  gender: String,
                  color: String,
                  sterilization: String,
                  chip: String)
}

class FMPAddPatViewController: FMPViewController {

    weak var delegate: FMPAddPatViewControllerDelegate?

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"

        return label
    }()

    private lazy var nameTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    private lazy var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date of Birth:"

        return label
    }()

    private lazy var dateOfBirthTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.inputView = self.datePicker
        text.inputAccessoryView = self.doneToollBar
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type:"

        return label
    }()

    private lazy var typeTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    private lazy var breedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Breed:"

        return label
    }()

    private lazy var breedTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender:"

        return label
    }()

    // ставить значения от сегмента
    private lazy var segments = ["Male:", "Female:"]

    private lazy var genderSegmentedControlDescription: UISegmentedControl = {
        var segments = ["Male:", "Female:"]
        let control = UISegmentedControl(items: segments )
        control.selectedSegmentTintColor = .systemGreen
        control.translatesAutoresizingMaskIntoConstraints = false

        return control
    }()

    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color:"

        return label
    }()

    private lazy var colorTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    private lazy var sterilizationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chip:"

        return label
    }()

    private lazy var chipTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

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

    override func initController() {
        super.initController()
        self.setContentScrolling(isEnabled: false)

        self.mainView.addSubviews([
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

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        guard nameTextFieldDescription.text != "",
              dateOfBirthTextFieldDescription.text != "",
              typeTextFieldDescription.text != "",
              breedTextFieldDescription.text != "",
              genderSegmentedControlDescription.isSelected,
              colorTextFieldDescription.text != "",
              chipTextFieldDescription.text != "" else {return}

        /// ?????????

        delegate?.passData(name: nameTextFieldDescription.text ?? "error",
                           dateOfBirth: dateOfBirthTextFieldDescription.text ?? "error",
                           type: typeTextFieldDescription.text ?? "error",
                           breed: breedTextFieldDescription.text ?? "error",
                           gender: genderSegmentedControlDescription.description,
                           color: colorTextFieldDescription.text ?? "error",
                           sterilization: sterilizationToString(swich: sterilizationSwitchDescription),
                           chip: chipTextFieldDescription.text ?? "error")

    }



    override func updateViewConstraints() {

        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(50)
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
            //            make.right.equalToSuperview().offset(30)

        }

        self.dateOfBirthTextFieldDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameTextFieldDescription.snp.bottom).offset(5)
            make.left.greaterThanOrEqualTo(self.dateOfBirthLabel.snp.right).inset(5)
            make.right.equalToSuperview().inset(30)
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

    func sterilizationToString(swich: UISwitch) -> String {
        if swich.isOn {
            return "Yes"
        } else {
            return "No"
        }
    }

    @objc private func valueChanged(sender: UIDatePicker) {
        self.dateOfBirthTextFieldDescription.text = sender.date.toString()
    }

    @objc private func doneTapped() {
        self.dateOfBirthTextFieldDescription.resignFirstResponder()
    }

}
