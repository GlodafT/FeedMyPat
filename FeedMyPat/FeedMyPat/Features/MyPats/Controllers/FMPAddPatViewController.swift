//
//  FMPAddPatViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 15.04.21.
//

import UIKit
import SnapKit

class FMPAddPatViewController: FMPViewController {

    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"

        return label
    }()

    var nameTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    var dateOfBirthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date of Birth:"

        return label
    }()

    var dateOfBirthTextFieldDescription: UILabel = {
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
        label.text = "Type"

        return label
    }()

    var typeTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    var breedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Breed:"

        return label
    }()

    var breedTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    var genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender:"

        return label
    }()

    // ставить значения от сегмента
    var segments = ["Male:", "Female:"]

    var genderSegmentedControlDescription: UISegmentedControl = {
        var segments = ["Male:", "Female:"]
        let control = UISegmentedControl(items: segments )
//        control.setTitle("Male", forSegmentAt: 1)
//        control.setTitle("Female", forSegmentAt: 2)
        control.selectedSegmentTintColor = .systemGreen
        control.translatesAutoresizingMaskIntoConstraints = false

        return control
    }()

    var colorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color:"

        return label
    }()

    var colorTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    var sterilizationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sterilization:"

        return label
    }()

    var sterilizationSwitchDescription: UISwitch = {
        let swich = UISwitch()

        swich.translatesAutoresizingMaskIntoConstraints = false

        return swich
    }()

    var chipLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chip:"

        return label
    }()

    var chipTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 18)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    override func initController() {
        super.initController()
        self.setContentScrolling(isEnabled: true)

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

//        setDescriptionToLabel()

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
            make.left.greaterThanOrEqualTo(self.dateOfBirthLabel.snp.right)
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

    private func setDescriptionToLabel() {
        nameLabel.text = "Name:"
        dateOfBirthLabel.text = "Date of Birth:"
        typeLabel.text = "Type:"
        breedLabel.text = "Breed:"
        genderLabel.text = "Gender:"
        colorLabel.text = "Color:"
        sterilizationLabel.text = "Sterilization:"
        chipLabel.text = "Chip:"
    }

}
