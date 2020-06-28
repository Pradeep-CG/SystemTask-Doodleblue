//
//  TourCollectionReusableView.swift
//  Pradeep-SystemTask
//
//  Created by Pradeep on 27/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

protocol HeaderCellProtocol:class {
    func onExpandCollapseSelected(forSection:Int, isSelected:Bool)
}

class TourCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var expandImageView: UIImageView!
    
    var currentSection:Int?
    weak var delegate:HeaderCellProtocol?
    var isExpanded = true
    
    var sectionData:CollectionModel?{
        didSet{
            if sectionData?.isExpanded ?? true {
                expandImageView.image = UIImage(systemName: "chevron.down")
            }
            else{
                expandImageView.image = UIImage(systemName: "chevron.right")
            }
            isExpanded = sectionData?.isExpanded ?? true
        }
    }
    
    @IBAction func onHeaderButtonClicked(_ sender: Any) {
        
        isExpanded.toggle()
        
        if isExpanded {
            expandImageView.image = UIImage(systemName: "chevron.down")
        }
        else{
            expandImageView.image = UIImage(systemName: "chevron.right")
        }
        delegate?.onExpandCollapseSelected(forSection: currentSection ?? 0, isSelected: isExpanded)
    }
}

