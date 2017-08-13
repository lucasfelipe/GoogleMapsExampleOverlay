//
//  OverlayViewCell.swift
//  GMapViewOveralayExample
//
//  Created by Lucas  Felipe on 13/08/17.
//  Copyright © 2017 Lucas. All rights reserved.
//

import UIKit

class OverlayViewCell: UICollectionViewCell {
    
    var elementButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    override func prepareForReuse() {
        self.addSubview(elementButton)
        
        elementButton.topAnchor(equalTo: self.topAnchor)
            .leadingAnchor(equalTo: self.leadingAnchor)
            .trailingAnchor(equalTo: self.trailingAnchor)
            .bottomAnchor(equalTo: self.bottomAnchor)
    }
    
}
