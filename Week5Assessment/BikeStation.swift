//
//  BikeStation.swift
//  Week5Assessment
//
//  Created by Charles Lee on 24/2/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import Foundation
import SwiftyJSON

class BikeStation {
    
    static var allBikeStations : [BikeStation] = []
    var stationName: String
    var availableBikes: Int
    var latitude: Double
    var longitude: Double
    //var distance: String
    
    
    
    init(json: JSON){
        stationName = json["stationName"].stringValue
        availableBikes = json["availableBikes"].intValue
        latitude = json["latitude"].doubleValue
        longitude = json["longitude"].doubleValue
    }t
}
