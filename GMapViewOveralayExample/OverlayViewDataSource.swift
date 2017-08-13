//
//  OverlayViewDataSource.swift
//  GMapViewOveralayExample
//
//  Created by Lucas  Felipe on 13/08/17.
//  Copyright © 2017 Lucas. All rights reserved.
//

import Foundation
import UIKit

class OverlayViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: OverlayView!
    
    private let elements: Array<String> = ["Visa", "Mastercard", "Elo", "Amex", "Credicard"]
    
    private let cellIdentifier = "OverlayCell"
    
    init(collectionView: OverlayView) {
        super.init()
        self.collectionView = collectionView
        self.collectionView.register(OverlayViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! OverlayViewCell
        cell.prepareForReuse()
        cell.elementButton.titleLabel?.text = elements[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 40)
    }
    
    func list() {
        collectionView.reloadData()
    }
    
}
