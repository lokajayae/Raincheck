//
//  Weather.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 31/05/24.
//

import Foundation

struct WeatherResponse: Decodable {
    var name: String
    let dt: Int
    var coord: Location
    var weather: [WeatherDetail]
    var main: MainInformation
    let wind: WindInformation
    
    func getDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self.dt))
    }
}

struct Location: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherDetail: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    func getSFIcon() -> String{
        let iconMapping: [String: String] = [
                "01d": "sun.max",
                "01n": "moon.stars",
                "02d": "cloud",
                "02n": "cloud",
                "03d": "cloud",
                "03n": "cloud",
                "04d": "cloud",
                "04n": "cloud",
                "09d": "cloud.rain",
                "09n": "cloud.rain",
                "10d": "cloud.heavyrain",
                "10n": "cloud.heavyrain",
                "11d": "cloud.bolt.rain",
                "11n": "cloud.bolt.rain",
                "13d": "snowflake",
                "13n": "snowflake",
                "50d": "cloud.fog",
                "50n": "cloud.fog"
            ]

        return iconMapping[self.icon] ?? "questionmark"
    }
}

struct MainInformation: Decodable {
    var temp: Double
    let temp_min: Double
    let temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct WindInformation: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}
