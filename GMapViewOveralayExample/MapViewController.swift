//
//  MapViewController.swift
//  GMapViewOveralayExample
//
//  Created by Lucas  Felipe on 06/08/17.
//  Copyright © 2017 Lucas. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, MapViewPresenter {

    lazy var mapViewDataSource: MapViewDataSource = MapViewDataSource(withPresenter: self)
    lazy var collectionViewDataSource: OverlayViewDataSource = OverlayViewDataSource(collectionView: self.collectionView)
    
    var collectionView: OverlayView = {
        var collectionView = OverlayView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        return collectionView
    }()
    
    let navigationBar: UINavigationBar = {
        let navBar = UINavigationBar(frame: .zero)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    var mapView: UIView = {
        let mapV = UIView(frame: .zero)
        mapV.translatesAutoresizingMaskIntoConstraints = false
        return mapV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewDataSource.askForLocation()
        addSubviews()
        setup()
    }
    
    func addSubviews() {
        self.view.addSubview(navigationBar)
        self.view.addSubview(mapView)
    }
    
    func setup() {
        navigationBar.leadingAnchor(equalTo: view.leadingAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .topAnchor(equalTo: view.topAnchor)
            .heightAnchor(equalTo: 50)
        
        let navigation = UINavigationItem()
        navigation.title = "Map View"
        navigation.setLeftBarButton(
            UIBarButtonItem(
                title: "Overlay",
                style: .plain,
                target: self,
                action: #selector(createOverlay)), animated: true)
        
        navigationBar.items = [navigation]
        
        mapView.leadingAnchor(equalTo: view.leadingAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .topAnchor(equalTo: navigationBar.bottomAnchor)
        
    }
    
    
    func createOverlay() {
        if self.collectionView.isDescendant(of: self.view) { collectionView.removeFromSuperview() }
        else {
            self.view.addSubview(collectionView)
            collectionView
                .trailingAnchor(equalTo: view.trailingAnchor)
                .leadingAnchor(equalTo: view.leadingAnchor)
                .bottomAnchor(equalTo: view.bottomAnchor)
                .heightAnchor(equalTo: 200)
            
           collectionViewDataSource.list()
        }
        
    }
    
    //MARK: Presenter Methods
    func updateLocation(location: CLLocation) {
        mapViewDataSource.createMap(location)
    }
    
    func updateViewWithMapView(map: UIView) {
        self.mapView.addSubview(map)
        map.leadingAnchor(equalTo: self.mapView.leadingAnchor)
            .trailingAnchor(equalTo: self.mapView.trailingAnchor)
            .topAnchor(equalTo: self.mapView.topAnchor)
            .bottomAnchor(equalTo: self.mapView.bottomAnchor)
    }

}
