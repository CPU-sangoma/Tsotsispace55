//
//  WeatherModel.swift
//  Tsotsistarship
//
//  Created by Lesego Mogorosi on 2023/03/07.
//

import Foundation


struct WeatherResponse: Codable{
    let forecasts: [WeatherObj]
    let lastUpdated: String
    let weatherStation: String
}



struct WeatherObj: Codable {
    let date: String
    let temp: Double
    let humidity: Int
    let windSpeed: Int
    let safe: Bool
}
