//
//  Extensions.swift
//  CurrentWeather
//
//  Created by Tushar Katyal on 04/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit

// to convert temp's
extension Double {
    
    func celsiusToFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func fahrenheitToCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    func kelvinToCelcius() -> Double {
        return self - 273.15
    }
}

extension Date {
    
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
