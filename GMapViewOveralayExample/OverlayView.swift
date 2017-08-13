//
//  OverlayView.swift
//  GMapViewOveralayExample
//
//  Created by Lucas  Felipe on 09/08/17.
//  Copyright © 2017 Lucas. All rights reserved.
//

import UIKit

class OverlayView: UICollectionView {
    
    override var inputAccessoryView: UIView? {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .bottomAnchor(equalTo: topAnchor)
            .heightAnchor(equalTo: 10)
        return view
    }

}
