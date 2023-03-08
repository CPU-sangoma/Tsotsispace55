//
//  File.swift
//  Tsotsistarship
//
//  Created by Lesego Mogorosi on 2023/03/08.
//

import Foundation


class WeatherTableCellViewModel {
    
    var date: String
    var temp: String
    var humidity: String
    var windSpeed: String
    var safe: String
    
    init(data: WeatherObj){
        self.date = "Date: \(data.date)"
        self.temp = "Temp: \(data.temp)"
        self.humidity = "Humidity: \(data.humidity)"
        self.windSpeed = "WindSpeed: \(data.windSpeed)"
        self.safe = "Safe: \(data.safe)"
    }
    
}
