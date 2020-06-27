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
}


struct PlaceModel {
    
    static var placesArray = [CollectionModel]()
    
    static var delhi = ["Akshardham", "Red Fort", "Jama Masjid", "Agrasen", "Lodhi Gardens", "Lotus Temple", "Jantar Mantar", "National Museum", "Bangla Sahib", "Qutub Minar", "Chattarpur Temple", "India Gate"]
    
    static var goa = ["Cruise","Dudhsagar Falls","Scuba Diving","Anjuna Beach","Tambdi Surla","Dona Paula","Malvan Fort","Calangute Beach","Baga Beach","Cape Town Cafe","Fort Aguada","Mahadeva Temple"]
    
    static var kasmir = ["Srinagar","Gulmarg","Pahalgam","Doda","Leh","Pulwama","Sonmarg","Kargil","Hemis","Kathua","Kishtwar","Kupwara"]
    
    static var maharastra = ["Aurangabad","Nasik","Bhandaradara","Pune","Ganapatipule","Khandala","Matheran","Lavasa","Rajamachi","Alibaag","Kolad","Lonavala"]
    
    static var mysore = ["Somanathapura Temple","Sanjeevini Park","Zoological Gardens","Railway Museum","Kukkarahally-lake","Brindavan Gardens","Varahaswamy Temple","Shuka Vana"," Planet X","Jagmohan Palace","Sri Nandi Temple","KRS Dam","Karanji Lake"]
    
    
    static func getPlaceModel() -> [CollectionModel] {
        
        placesArray.append(CollectionModel(isExpanded: true, placeName: "Delhi", row: getDelhiModel()))
        placesArray.append(CollectionModel(isExpanded: true, placeName: "Goa", row: getGoaModel()))
        placesArray.append(CollectionModel(isExpanded: true, placeName: "Kasmir", row: getKasmirModel()))
        placesArray.append(CollectionModel(isExpanded: true, placeName: "Maharastra", row: getMaharastraModel()))
        placesArray.append(CollectionModel(isExpanded: true, placeName: "Mysore", row: getMysoreModel()))
        
        return placesArray
    }
    static func getDelhiModel() -> [RowModel] {
        
        var delhiArr = [RowModel]()
        
        for item in delhi {
            delhiArr.append(RowModel(title: item))
        }
        return delhiArr
    }
    static func getGoaModel() -> [RowModel] {
        
        var goaArr = [RowModel]()
        
        for item in goa {
            goaArr.append(RowModel(title: item))
        }
        return goaArr
    }
    static func getKasmirModel() -> [RowModel] {
        
        var kasmirArr = [RowModel]()
        
        for item in kasmir {
            kasmirArr.append(RowModel(title: item))
        }
        return kasmirArr
    }
    static func getMaharastraModel() -> [RowModel] {
        
        var maharastraArr = [RowModel]()
        
        for item in maharastra {
            maharastraArr.append(RowModel(title: item))
        }
        return maharastraArr
    }
    static func getMysoreModel() -> [RowModel] {
        
        var mysoreArr = [RowModel]()
        
        for item in mysore {
            mysoreArr.append(RowModel(title: item))
        }
        return mysoreArr
    }
    
}

