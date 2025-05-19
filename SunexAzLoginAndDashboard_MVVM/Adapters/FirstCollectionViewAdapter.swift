//
//  FirstCollectionViewAdapter.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation
import UIKit

struct FirstItem {
    let image: String
    let title: String
}

class FirstCollectionViewAdapter: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var items: [GroupFirstCollectionViewCell.Item] = []
    
    init(items: [GroupFirstCollectionViewCell.Item]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupFirstCollectionViewCell", for: indexPath) as! GroupFirstCollectionViewCell
        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
