//
//  FMPAllPatsViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 5.05.21.
//

import UIKit
import RealmSwift

class FMPAllPatsViewController: UITableViewController {

    let realm = FMPRealmManager.safeRealm

    // MARK: - Private Properties

    private lazy var patData: Results<FMPPatModel> = { self.realm.objects(FMPPatModel.self)}()
    private lazy var mediCatModels: Results<FMPMedicatModel> = {self.realm.objects(FMPMedicatModel.self)}()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pats"
        self.tableView.register(FMPMyPatCell.self, forCellReuseIdentifier: FMPMyPatCell.reuseIdentifire)
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FMPMyPatCell.reuseIdentifire, for: indexPath)

        if let cell = cell as? FMPMyPatCell {
            cell.set(patModel: self.patData[indexPath.row])
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = self.patData[indexPath.row].id
        FMPRealmManager.write(realm: realm) {
            for model in self.mediCatModels {
                if model.id == id {
                    realm.delete(model)
                }
            }
            realm.delete(self.patData[indexPath.row])
        }
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.tableView.reloadData()
        self.tableView.setNeedsUpdateConstraints()

        if self.patData.count > 1{
        for object in self.patData {
            if object.id == String(indexPath.row) {
                let indexOfLoadedPat = self.patData.index(of: object)
                let indexOfNextPat = self.patData.index(before: indexOfLoadedPat ?? 0)
                guard indexOfNextPat >= 0 else {return}
                FSP.selectPatId = self.patData[indexOfNextPat].id
            }
        }
        } else if self.patData.count == 1 {
            FSP.selectPatId = self.patData[0].id
        } else {
            FSP.selectPatId = ""
        }

    }

}
