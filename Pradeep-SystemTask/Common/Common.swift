//
//  Common.swift
//  Pradeep-SystemTask
//
//  Created by Pradeep on 28/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import Foundation

struct Common {
    
    static var placesArray = [CollectionModel]()
    
    static func getPlaceModel() -> [CollectionModel] {
        
        placesArray.append(CollectionModel(isExpanded: true, placeName: "Delhi", row: getDelhiModel()))
        placesArray.append(CollectionModel(isExpanded: false, placeName: "Goa", row: getGoaModel()))
        placesArray.append(CollectionModel(isExpanded: false, placeName: "Kasmir", row: getKasmirModel()))
        placesArray.append(CollectionModel(isExpanded: false, placeName: "Maharastra", row: getMaharastraModel()))
        placesArray.append(CollectionModel(isExpanded: false, placeName: "Mysore", row: getMysoreModel()))
        
        return placesArray
    }
    static func getDelhiModel() -> [RowModel] {
        
        var delhiArr = [RowModel]()
        
        for item in Places.delhi {
            delhiArr.append(RowModel(title: item, isSelected: false))
        }
        return delhiArr
    }
    static func getGoaModel() -> [RowModel] {
        
        var goaArr = [RowModel]()
        
        for item in Places.goa {
            goaArr.append(RowModel(title: item, isSelected: false))
        }
        return goaArr
    }
    static func getKasmirModel() -> [RowModel] {
        
        var kasmirArr = [RowModel]()
        
        for item in Places.kasmir {
            kasmirArr.append(RowModel(title: item, isSelected: false))
        }
        return kasmirArr
    }
    static func getMaharastraModel() -> [RowModel] {
        
        var maharastraArr = [RowModel]()
        
        for item in Places.maharastra {
            maharastraArr.append(RowModel(title: item, isSelected: false))
        }
        return maharastraArr
    }
    static func getMysoreModel() -> [RowModel] {
        
        var mysoreArr = [RowModel]()
        
        for item in Places.mysore {
            mysoreArr.append(RowModel(title: item, isSelected: false))
        }
        return mysoreArr
    }
}
