//
//  SecondCollectionViewAdapter.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation
import UIKit

class SecondCollectionViewAdapter: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var newsItems: [SecondCollectionViewCell.Item] = []

    init(newsItems: [SecondCollectionViewCell.Item]) {
        self.newsItems = newsItems
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
        let item = newsItems[indexPath.row]
        cell.configure(with: item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}
