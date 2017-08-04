//
//  WeatherCell.swift
//  CurrentWeather
//
//  Created by Tushar Katyal on 04/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
// cocoatouch class for table cell to update data on cells

import UIKit

class WeatherCell: UITableViewCell {
    // references for cell
    @IBOutlet weak var weatherTypeImg: UIImageView!
    @IBOutlet weak var weatherForcastDayLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var tempMaxLbl: UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
   
    func configureCell(forcast:Forcast){
        
        weatherForcastDayLbl.text = forcast.date
        weatherTypeLbl.text = forcast.weatherType
        weatherTypeImg.image = UIImage(named: forcast.weatherType)
        tempMinLbl.text = "\(forcast.tempMin)°C"
        tempMaxLbl.text = "\(forcast.tempMax)°C"
    }
    
    

}
