//
//  Forcast.swift
//  CurrentWeather
//
//  Created by Tushar Katyal on 04/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
// initializing data for cells and getting from API using Alamofire

import UIKit
import Alamofire

class Forcast {
    
    var _date : String!
    var _weatherType : String!
    var _tempMin : String!
    var _tempMax : String!
    
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var tempMin : String {
        if _tempMin == nil {
            _tempMin = ""
        }
        return _tempMin
    }
    var tempMax : String {
        if _tempMax == nil {
            _tempMax = ""
        }
        return _tempMax
    }
    
    var date : String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    init(weatherDict : Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                self._tempMin = "\(round(min.kelvinToCelcius()))"
            }
            if let max = temp["max"] as? Double {
                self._tempMax = "\(round(max.kelvinToCelcius()))"
            }
        }
    
        if let weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
}

