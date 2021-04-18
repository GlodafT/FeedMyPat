//
//  FMPMedicatViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 4.04.21.
//

import UIKit

class FMPMedicatViewController: FMPViewController {

    // MARK: - gui variables

    private lazy var isEditButtonTapped: Bool = false

    lazy var models: [FMPMedicatModel] = [] {
        didSet {
            self.collectionView.reloadData()
//            self.setNeedsUpdateConstraints()
        }
    }

    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)

        view.backgroundColor = .systemBlue
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.register(FMPMedicatCell.self, forCellWithReuseIdentifier: FMPMedicatCell.reuseIdentifier)

        return view
    }()

    private lazy var editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.editButtonTapped))
    private lazy var addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonTapped))

    // MARK: - initialization

    override func initController() {
        super.initController()

        self.mainView.backgroundColor = .blue

        self.controllerTitle = "Medicat"

        self.setContentScrolling(isEnabled: false)

        self.mainView.addSubview(self.collectionView)

        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.navigationItem.setRightBarButtonItems([self.addBarButton, self.editBarButton], animated: true)

    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .blue
//        self.navigationController?.navigationBar.isHidden = false
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        self.navigationController?.navigationBar.isHidden = true
//
//    }

    @objc private func editButtonTapped() {
        self.isEditButtonTapped.toggle()
        if self.isEditButtonTapped {
            self.collectionView.backgroundColor = .systemRed
        } else {
            self.collectionView.backgroundColor = .systemBlue
        }

    }

    @objc private func addButtonTapped() {
        self.navigationController?.present(FMPMedicatAddViewController(), animated: true)
    }

}

extension FMPMedicatViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FMPMedicatCell.reuseIdentifier, for: indexPath)

        if let cell = cell as? FMPMedicatCell {
//            let array = Array(self.models)[indexPath.section]

            cell.set(medicatModel: models[indexPath.row])
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.backgroundColor = .systemTeal
        guard isEditButtonTapped else { return }
        self.models.remove(at: indexPath.row)
        self.collectionView.deleteItems(at: [indexPath])
    }
}

extension FMPMedicatViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width - 40, height: self.view.bounds.height / 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
