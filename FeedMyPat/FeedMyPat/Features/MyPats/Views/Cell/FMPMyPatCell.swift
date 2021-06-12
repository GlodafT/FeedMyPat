//
//  FMPMyPatCell.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 5.05.21.
//

import UIKit
import RealmSwift

class FMPMyPatCell: UITableViewCell {

    let realm = FMPRealmManager.safeRealm
    lazy var mediCatModels: Results<FMPMedicatModel> = {self.realm.objects(FMPMedicatModel.self)}()

    static let reuseIdentifire: String = "FMPMyPatCell"

    private lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = . systemGray3
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var patImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .systemGray2
        view.image = UIImage(named: "tabBarHomeIcon")          /// поменять
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var nameLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    private lazy var entriesLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Entries:"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    private lazy var entriesCountLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initCell() {
        self.contentView.addSubview(self.cellView)
        self.cellView.addSubviews([self.patImageView,
                                   self.nameLabel,
                                   self.entriesLabel,
                                   self.entriesCountLabel])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func updateConstraints() {

        self.cellView.snp.updateConstraints { (make) in
            make.edges.equalToSuperview().inset(5)
        }

        self.patImageView.snp.updateConstraints { (make) in
            make.height.width.equalTo(80)
            make.left.top.bottom.equalToSuperview().inset(20)
        }

        self.nameLabel.snp.updateConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.left.equalTo(self.patImageView.snp.right).offset(40)
            make.right.greaterThanOrEqualToSuperview()
        }

        self.entriesLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).inset(10)
            make.left.equalTo(self.patImageView.snp.right).offset(40)
            make.bottom.greaterThanOrEqualToSuperview().inset(20)
        }

        self.entriesCountLabel.snp.updateConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).inset(10)
            make.left.equalTo(self.entriesLabel.snp.right).offset(3)
            make.bottom.greaterThanOrEqualToSuperview().inset(20)

        }

        super.updateConstraints()
    }

    func set(patModel: FMPPatModel) {
        self.nameLabel.text = patModel.nameLabelDescription
        var dataCount: Int = 0
        for model in mediCatModels {
            if model.id == patModel.id {
                dataCount += 1
            }
        }
        self.entriesCountLabel.text = String(dataCount)

        self.setNeedsUpdateConstraints()
    }

}
