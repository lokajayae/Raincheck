//
//  WeatherView.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 01/06/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: WeatherResponse
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                    Text("Today, \(weather.getDate().formatted(.dateTime.day().month().year().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Spacer()
                
                VStack {
                    HStack(spacing: 20) {
                        VStack {
                            Image(systemName: weather.weather[0].getSFIcon())
                                .font(.system(size: 50))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        Text("\(String(format: "%.0f", weather.main.temp))°")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer().frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                        } placeholder: {
                            ProgressView()
                        }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(width: .infinity, height: .infinity)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding()
                    HStack {
                        WeatherComponent(logo: "thermometer", name: "Min temp", value: "\(String(format: "%.0f", weather.main.temp_min))°")
                        Spacer()
                        WeatherComponent(logo: "thermometer", name: "Max temp", value: "\(String(format: "%.0f", weather.main.temp_max))°")
                    }
                    HStack {
                        WeatherComponent(logo: "wind", name: "Wind", value: "\(String(format: "%.0f", weather.wind.speed)) m/s")
                        Spacer()
                        WeatherComponent(logo: "humidity", name: "Humidity", value: "\(String(format: "%.0f", weather.main.humidity))%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color("backgroundColor"))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color("backgroundColor"))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(
        weather: WeatherResponse(
            name: "Zocca",
            dt: 1717174559,
            coord: Location(lon: 10.99, lat: 44.34),
            weather: [WeatherDetail(
                id: 501,
                main: "Rain",
                description: "moderate rain",
                icon: "10d")
            ],
            main: MainInformation(
                temp: 29.48,
                temp_min: 29,
                temp_max: 32,
                pressure: 1015,
                humidity: 64
            ),
            wind: WindInformation(
                speed: 29,
                deg: 20,
                gust: 10)
        )
    )
}
