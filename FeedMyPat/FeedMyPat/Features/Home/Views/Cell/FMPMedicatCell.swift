//
//  FMPMedicatCell.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 7.04.21.
//

import UIKit
import SnapKit

class FMPMedicatCell: UICollectionViewCell {

    static let reuseIdentifier: String = "FMPMedicatCell"

    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 25
        view.layer.borderColor = UIColor.systemGray2.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .systemGreen
        view.image = UIImage(named: "tabBarHomeIcon")          /// поменять
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nameLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    private lazy var typeLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black  // поменять
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    private lazy var typeDescriptionLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    private lazy var dateLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black // поменять
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    private lazy var dateDescriptionLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .green
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initview() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(self.cellView)
        self.contentView.addSubviews([self.imageView,
                                      self.nameLabel,
                                      self.typeLabel,
                                      self.typeDescriptionLabel,
                                      self.dateLabel,
                                      self.dateDescriptionLabel])
    }

    // MARK: - constraints

    override func updateConstraints() {
        self.cellView.snp.updateConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }

        self.imageView.snp.updateConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
//            make.width.equalTo(self.cellView.bounds.width / 4)
        }

        self.nameLabel.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(self.imageView.snp.right).offset(5)
        }

        self.typeLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(20)
            make.left.equalTo(self.imageView.snp.right).offset(5)
        }

        self.typeDescriptionLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.typeLabel.snp.bottom).offset(10)
            make.left.equalTo(self.imageView.snp.right).offset(5)
        }

        self.dateLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(15)
        }

        self.dateDescriptionLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.dateLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().inset(15)                     //решить проблему с отступом
        }

        super.updateConstraints()
    }

    func set(typeVaccination: String, date: Date) {
        self.nameLabel.text = "Vaccination"
        self.typeLabel.text = "Type"
        self.dateLabel.text = "Date"
        self.typeDescriptionLabel.text = typeVaccination
        self.dateDescriptionLabel.text = date.toString()

        self.setNeedsUpdateConstraints()
    }

}
