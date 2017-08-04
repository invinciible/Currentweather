//
//  ViewController.swift
//  CurrentWeather
//
//  Created by Tushar Katyal on 03/08/17.
//  Copyright © 2017 Tushar Katyal. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController ,UITableViewDelegate,UITableViewDataSource , CLLocationManagerDelegate {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather : CurrentWeather!
    var forcast : Forcast!
    var forcasts = [Forcast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.downloadForcastDetails {
                self.updateMainUI()
            }
            
        }
    }
    
    // function to get forcast data from API using Alamofire
    
    func downloadForcastDetails(completed : @escaping DownloadComplete) {
        
        let requestUrl = URL(string: forcast_url)!
        Alamofire.request(requestUrl).responseJSON { response in
            
            let request = response.result
            
            if let dict = request.value as? Dictionary<String , AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String ,AnyObject>] {
                    
                    for obj in list {
                       
                        let forcast = Forcast(weatherDict : obj)
                        self.forcasts.append(forcast)
                    }
                    self.forcasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
        completed()
      }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forcastData =  forcasts[indexPath.row]
            cell.configureCell(forcast: forcastData)
            return cell
        }
        else {
            return WeatherCell()
        }
    
    }

    
    func updateMainUI() {
        
        dateLbl.text = currentWeather.date
        currentTempLbl.text = "\(currentWeather.currentTemp)"
        locationLbl.text = currentWeather.cityName
        currentWeatherImg.image = UIImage(named: currentWeather.weatherType)
        currentWeatherTypeLbl.text = currentWeather.weatherType
    }
    
}

