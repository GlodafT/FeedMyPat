//
//  FMPMedicatAddViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 11.04.21.
//

import UIKit
import SnapKit

class FMPMedicatAddViewController: FMPViewController {

//    let addButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .clear
//        button.setTitle("Add", for: UIControl.State())
//        button.setImage(UIImage(systemName: "Plus"), for: UIControl.State())
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.systemGray3.cgColor
//
//        return button
//    }()

//    let imageViewButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .systemGray
//        button.setImage(UIImage(named: "tabBarHomeIcon"), for: UIControl.State())
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 35
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        button.addTarget(self, action: #selector(imageViewButtonTapped), for: .touchUpInside)
//
//        return button
//    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Vaccine"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Type:"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var typeTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 16)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Date:"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var  dateTextFieldDescription: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray4
        text.textColor = .systemGreen
        text.tintColor = .systemGreen
        text.font = UIFont.systemFont(ofSize: 16)
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        text.inputView = self.datePicker
        text.inputAccessoryView = self.doneToollBar

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

        self.mainView.backgroundColor = .systemPink
        self.setContentScrolling(isEnabled: false)

        self.mainView.addSubviews([
//            self.imageViewButton,
            self.nameLabel,
            self.typeLabel,
            self.typeTextFieldDescription,
            self.dateLabel,
            self.dateTextFieldDescription
        ])
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

//    private func saveData() {
//        guard let typeDescription = typeTextFieldDescription.text, let dateDescription = dateTextFieldDescription.text else { return }
//        if !typeDescription.isEmpty && !dateDescription.isEmpty {
//            FMPMedicatViewController.models
//        }
//    }

    override func updateViewConstraints() {
        self.nameLabel.snp.updateConstraints { (make) in
            make.top.equalToSuperview().inset(50)
            make.left.equalToSuperview().inset(15)

        }

        self.typeLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(15)

        }

        self.typeTextFieldDescription.snp.updateConstraints { (make) in
            make.top.equalTo(self.typeLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(35)

        }

        self.dateLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.typeTextFieldDescription.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(15)

        }

        self.dateTextFieldDescription.snp.updateConstraints { (make) in
            make.top.equalTo(self.dateLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(35)

        }

//        self.imageViewButton.snp.updateConstraints { (make) in
//            make.top.equalTo(self.dateTextFieldDescription.snp.bottom).offset(10)
//            make.left.equalToSuperview().inset(15)
//
//        }

        super.updateViewConstraints()
    }

    @objc private func imageViewButtonTapped() {
        // выбор фото из галллереи
    }

    @objc private func valueChanged(sender: UIDatePicker) {
        self.dateTextFieldDescription.text = sender.date.toString()
    }

    @objc private func doneTapped() {
        self.dateTextFieldDescription.resignFirstResponder()
    }
}
