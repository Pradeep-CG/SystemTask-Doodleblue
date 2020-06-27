//
//  TourViewController.swift
//  Pradeep-SystemTask
//
//  Created by Pradeep on 27/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class TourViewController: UIViewController {

    @IBOutlet weak var tourCollectionView: UICollectionView!
    var collectionDataArray:[CollectionModel] = PlaceModel.getPlaceModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Tourist Place In India"
       
    }
}


extension TourViewController : UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionDataArray.count
     }
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionDataArray[section].isExpanded ?? true {
            return collectionDataArray[section].row?.count ?? 0
        }
        else{
            return 0
        }
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tourCell", for: indexPath) as! TourCollectionViewCell
        cell.rowData = collectionDataArray[indexPath.section].row?[indexPath.row]
         
         return cell
     }
}

extension TourViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
    }
}

extension TourViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 4
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 1
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 20) / 3 , height: 130.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
