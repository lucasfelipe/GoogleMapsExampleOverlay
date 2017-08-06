//
//  MapViewPresenter.swift
//  GMapViewOveralayExample
//
//  Created by Lucas  Felipe on 06/08/17.
//  Copyright © 2017 Lucas. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapViewPresenter {
    func updateViewWithMapView(map: UIView)
    func updateLocation(location: CLLocation)
}
