//
//  Location.swift
//  CurrentWeather
//
//  Created by Tushar Katyal on 04/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
// Singleton class

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var longitude : Double!
    var latitude : Double!
}
