//
//  CurrentWeather.swift
//  CurrentWeather
//
//  Created by Tushar Katyal on 03/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//  Class to download current weather information using Alamofire

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName : String!
    var _date : String!
    var _currentTemp :Double!
    var _weatherType : String!
    
    var cityName : String {
        
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    var date : String {
        if _date == nil {
            _date = ""
        }
        
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .none
        let currentDate = dateformatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    var currentTemp : Double {
        
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
   
    /* Closure to download the data from API in
    JSON Format and assigning it to variables */
    func downloadWeatherDetails(completed : @escaping DownloadComplete ) {
        //Alamofire Download JSON
        let currentWeatherUrl = URL(string: current_weather_url)!
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            let request = response.result
          
            if let dict = request.value as? Dictionary<String, AnyObject> {
            
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    
                }
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                       
                    }
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let currentTemp = main["temp"] as? Double {
                    self._currentTemp = round(currentTemp.kelvinToCelcius())
                        
                 }
                }
            
            }
        completed()
        }
    }
}


