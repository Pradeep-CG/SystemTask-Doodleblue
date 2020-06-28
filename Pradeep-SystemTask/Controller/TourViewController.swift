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
    var collectionDataArray:[CollectionModel] = Common.getPlaceModel()
    var isLongPressEnabled = false
    var isSinglePressEnabled = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Tourist Places In India"
        
        let longPressedGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        longPressedGesture.minimumPressDuration = 0.7
        longPressedGesture.delegate = self as? UIGestureRecognizerDelegate
        longPressedGesture.delaysTouchesBegan = true
        tourCollectionView?.addGestureRecognizer(longPressedGesture)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    /**
     # Long Press:
     * First Logn Press: This will allow user to select multple images in any section.
     * Second Longe Press: This will discard all selected images in any section.
     */
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if (gestureRecognizer.state != .began) {
            return
        }
        if isLongPressEnabled {
            isLongPressEnabled = false
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            resetCollectionModel()
        }
        else{
            isLongPressEnabled = true
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        
        tourCollectionView.reloadData()
    }
    
    /**
     Call this function to reset image selection in all sections
     */
    @objc func cancelTapped()  {
        isLongPressEnabled = false
        resetCollectionModel()
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        tourCollectionView.reloadData()
    }
    
    /**
     Call this function to reset isSelected property of  RowModel
     */
    func resetCollectionModel() {
        
        for sectionIndex in 0..<collectionDataArray.count {
            let rowCount:Int = collectionDataArray[sectionIndex].row?.count ?? 0
            for rowIndex in 0..<rowCount {
                collectionDataArray[sectionIndex].row?[rowIndex].isSelected = false
            }
        }
    }
}


extension TourViewController: HeaderCellProtocol{
    
    /**
     Expand/Collapse section upon selecting corresponding header
     */
    func onExpandCollapseSelected(forSection: Int, isSelected: Bool) {
        
        for item in 0..<collectionDataArray.count {
            if item == forSection {
                collectionDataArray[item].isExpanded = isSelected
            }
        }
        tourCollectionView.reloadData()
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
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "tourHeader", for: indexPath) as! TourCollectionReusableView
        headerCell.currentSection = indexPath.section
        headerCell.delegate = self
        headerCell.sectionData = collectionDataArray[indexPath.section]
        headerCell.headerLbl.text = collectionDataArray[indexPath.section].placeName?.uppercased()
        return headerCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tourCell", for: indexPath) as! TourCollectionViewCell
        
        cell.rowData = collectionDataArray[indexPath.section].row?[indexPath.row]
        
        if isLongPressEnabled {
            
            cell.checkImage.isHidden = false
            
            if (collectionDataArray[indexPath.section].row?[indexPath.row].isSelected)! {
                cell.layer.borderWidth = 3.0
                cell.checkImage.image = UIImage(systemName: "checkmark.circle.fill")
            }
            else {
                cell.layer.borderWidth = 1.0
                cell.checkImage.image = UIImage(systemName: "circle.fill")
            }
        }
        else{
            cell.checkImage.isHidden = true
            cell.layer.borderWidth = 1.0
        }
        
        return cell
    }
}

/// UITableViewDelegate conformance
extension TourViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        if isLongPressEnabled {
            if (collectionDataArray[indexPath.section].row?[indexPath.row].isSelected)! {
                collectionDataArray[indexPath.section].row?[indexPath.row].isSelected = false
            }
            else{
                collectionDataArray[indexPath.section].row?[indexPath.row].isSelected = true
            }
            self.tourCollectionView.reloadData()
        }
        else{
            if isSinglePressEnabled {
                isSinglePressEnabled = false
                
                if let cell = collectionView.cellForItem(at: indexPath) as? TourCollectionViewCell {
                    cell.layer.borderColor = UIColor.blue.cgColor
                    cell.layer.borderWidth = 3.0
                    cell.checkImage.isHidden = false
                    cell.checkImage.image = UIImage(systemName: "checkmark.circle.fill")
                    
                    let seconds = 0.7
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        self.collectionDataArray[indexPath.section].isExpanded = false
                        cell.layer.borderWidth = 1.0
                        cell.checkImage.isHidden = true
                        cell.checkImage.image = UIImage(systemName: "circle.fill")
                        self.isSinglePressEnabled = true
                        self.tourCollectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TourCollectionViewCell {
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 0.3
        }
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
