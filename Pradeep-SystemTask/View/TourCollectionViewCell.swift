//
//  TourCollectionViewCell.swift
//  Pradeep-SystemTask
//
//  Created by Pradeep on 27/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class TourCollectionViewCell: UICollectionViewCell {
    
        @IBOutlet weak var tourImage: UIImageView!
        @IBOutlet weak var tourTitle: UILabel!
        
        var rowData:RowModel?{
            didSet{
                tourImage.image = UIImage(named: rowData?.title ?? "")
                tourTitle.text = rowData?.title ?? ""
            }
        }
        override func awakeFromNib() {
          super.awakeFromNib()
            
    //        self.imgView.layer.cornerRadius = 8
    //        self.imgView.layer.masksToBounds = true
            self.layer.borderColor = UIColor.systemBlue.cgColor
            self.layer.borderWidth = 0.3
            self.layer.cornerRadius = 18

            
        }
}
