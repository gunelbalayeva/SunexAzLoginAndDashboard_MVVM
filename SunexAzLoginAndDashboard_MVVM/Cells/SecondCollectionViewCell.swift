//
//  SecondCollectionViewCell.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        struct Item {
            var image:String
        }
        
        func configure(with item:Item){
            imageView.image = UIImage(named: item.image )
        }
    


}
