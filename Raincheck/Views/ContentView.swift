//
//  ContentView.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationController = LocationController()
    @State var weather: WeatherResponse?
    
    var weatherController = WeatherController()
    
    var body: some View {
        VStack {
            if let location = locationController.userLocation {
                if let weatherData = weather {
                    WeatherView(weather: weatherData)
                }
                else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherController.fetchCurrentWeather(lon: location.longitude, lat: location.latitude)
                            }
                            catch {
                                print("Error while requesting weather")
                            }
                        }
                    
                }
            }
            else {
                if locationController.isRequestingLocation {
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationController)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
