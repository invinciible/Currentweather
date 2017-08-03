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

let current_weather_url = "\(base_url)\(latitude)35\(longitude)139\(app_id)\(app_key)"



