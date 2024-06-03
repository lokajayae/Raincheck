//
//  WeatherController.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 31/05/24.
//

import Foundation
import CoreLocation

class WeatherController {
    
    func fetchCurrentWeather(lon longitude: CLLocationDegrees, lat latitude: CLLocationDegrees) async throws -> WeatherResponse? {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=9fa7a3454832cfbc7e3b2228845ef91d&units=metric"
        
        guard let url = URL(string: urlString) else{fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if (response as? HTTPURLResponse)?.statusCode == 200 {
            let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
            return decodedData
        }
        else {
            fatalError("Error while request Weather API")
        }
    }
}
