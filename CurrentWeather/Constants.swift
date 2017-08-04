//
//  Constants.swift
//  CurrentWeather
//
//  Created by Tushar Katyal on 03/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import Foundation

let base_url = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longitude = "&lon="
let app_id = "&appid="
let app_key = "e2628fd1dbf523d5e260c7c68f3aa097"

typealias DownloadComplete = () -> ()

let current_weather_url = "\(base_url)\(latitude)\(Location.sharedInstance.latitude!)\(longitude)\(Location.sharedInstance.longitude!)\(app_id)\(app_key)"

let forcast_url = "https://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=e2628fd1dbf523d5e260c7c68f3aa097"

