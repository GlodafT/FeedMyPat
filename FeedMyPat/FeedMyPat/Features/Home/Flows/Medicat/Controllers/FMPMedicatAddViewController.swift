//
//  FMPMedicatAddViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 11.04.21.
//

import UIKit
import SnapKit
import RealmSwift

protocol FMPMedicatAddViewControllerDelegate: class {
    func loadData()
}

class FMPMedicatAddViewController: FMPViewController {

//    let realm: Realm = { do {
//    let realm = try Realm()
//    } catch let error as NSError {
//        Swift.debugPrint(error)
//    }
//    }()
    let realm = try! Realm()
    lazy var patData: Results<FMPPatModel> = { self.realm.objects(FMPPatModel.self) }()

    weak var delegate: FMPMedicatAddViewControllerDelegate?

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
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Vaccine"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var typeLabel: UILabel = {
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

    private lazy var dateLabel: UILabel = {
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
            self.saveButton,
            self.nameLabel,
            self.typeLabel,
            self.typeTextFieldDescription,
            self.dateLabel,
            self.dateTextFieldDescription
        ])
        addGesture()
    }

    override func updateViewConstraints() {
        self.saveButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(15)
            make.right.equalToSuperview().inset(20)
        }

        self.nameLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.saveButton.snp.bottom).offset(20)
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

        super.updateViewConstraints()
    }

     private func addNewMedicatData() {
//        let realm = try! Realm()
        try! realm.write {
            let mediCatData = FMPMedicatModel(id: FMAD.selectPatId,
                            type: self.typeTextFieldDescription.text ?? "",
                            date: self.dateTextFieldDescription.text ?? "")
            realm.add(mediCatData)
//            let newMediCat = FMPMedicatModel()
//            newMediCat.id = FMAD.selectPatId
//            newMediCat.typeDescriptionLabel = self.typeTextFieldDescription.text ?? ""
//            newMediCat.dateDescriptionLabel = self.dateTextFieldDescription.text ?? ""

//            for pat in self.patData {
//                guard pat.id == FMAD.selectPatId else {return}
//                pat.mediCatsData.append(newMediCat)
//            }

//            realm.add(newMediCat)
//            realm.
//            self.mediCatData = newMediCat
        }
    }

    fileprivate func addGesture() {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(tapRecognizer))
        self.mainView.addGestureRecognizer(recognizer)
    }

    @objc private func saveButtonTapped() {
        guard self.typeTextFieldDescription.text != "",
              self.dateTextFieldDescription.text != "" else { return }
//        let model: FMPMedicatModel = FMPMedicatModel(typeDescriptionLabel: self.typeTextFieldDescription.text ?? "error",
//                                                     dateDescriptionLabel: self.dateTextFieldDescription.text ?? "error")
//        guard let mainData = self.mainData else { return }
//        for animal in mainData.animals {
//            if animal.id == mainData.selectPatId {
//                animal.mediCatModel.append(model)
//            }
//        }
        self.addNewMedicatData()
        delegate?.loadData()
        self.dismiss(animated: true, completion: nil)
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

    @objc private func tapRecognizer() {
        self.mainView.endEditing(true)
        resignFirstResponder()
    }
}
