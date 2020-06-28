//
//  CollectionModel.swift
//  Pradeep-SystemTask
//
//  Created by Pradeep on 27/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import Foundation

struct CollectionModel {
    
    var isExpanded:Bool?
    var placeName:String?
    var row:[RowModel]?
}

struct RowModel {
    var title:String?
    var isSelected:Bool?
}

