//
//  MapViewDataSource.swift
//  GMapViewOveralayExample
//
//  Created by Lucas  Felipe on 06/08/17.
//  Copyright © 2017 Lucas. All rights reserved.
//

import Foundation
import GoogleMaps

class MapViewDataSource: NSObject, CLLocationManagerDelegate {
    
    private var presenter: MapViewPresenter!
    private let location = CLLocationManager()
    
    init(withPresenter: MapViewPresenter) {
        super.init()
        presenter = withPresenter
        location.delegate = self
    }
    
    func askForLocation() {
        location.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways: presenter.updateLocation(location: manager.location!)
        default: break
        }
    }
    
    func createMap(_ currentLocation: CLLocation) {
        let camera = GMSCameraPosition.camera(withLatitude: currentLocation.coordinate.latitude,
                                              longitude: currentLocation.coordinate.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        self.presenter.updateViewWithMapView(map: mapView)
    }
    
}
