//
//  FMPMapViewController.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 1.04.21.
//

import SnapKit
import MapKit

class FMPMapViewController: FMPViewController {

    // MARK: - gui variables

    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.delegate = self

        return view
    }()

    override func initController() {
        super.initController()
        self.setContentScrolling(isEnabled: false)

        self.controllerTitle = "Map"

        self.view.addSubview(self.mapView)

        self.mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension FMPMapViewController: MKMapViewDelegate {
    
}
