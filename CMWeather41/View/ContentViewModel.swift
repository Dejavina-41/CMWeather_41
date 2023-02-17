//
//  File.swift
//  CMWeather41
//
//  Created by cmStudent on 2023/02/12.
//

import Foundation

enum Area {
    case Toyko
    case Saitama
    case Kanagawa
    case Chiba
    case Tochigi
    case Gunma
    case Ibaraki
}

class ContentViewModel: ObservableObject {
    
    @Published var weather: ResponseWeather?
    @Published var isLode: Bool = true
    
    init() {
        fetch(lat: 35.689, lon: 139.692)
    }
    
    func fetch(lat: Double, lon: Double) {
        Fetcher().fetch(lat: lat, lon: lon) { weather in
            DispatchQueue.main.async {
                self.weather = weather
                self.isLode = false
            }
        }
    }
    
    func selectedArea(area: Area) {
        switch area {
        case .Toyko:
            print("東京")
            fetch(lat: 35.689, lon: 139.692)
        case .Saitama:
            print("埼玉")
            fetch(lat: 35.857, lon: 139.649)
        case .Kanagawa:
            print("神奈川")
            fetch(lat: 35.448, lon: 139.642)
        case .Chiba:
            print("千葉")
            fetch(lat: 35.605, lon: 140.123)
        case .Tochigi:
            print("栃木")
            fetch(lat: 36.563, lon: 139.883)
        case .Gunma:
            print("群馬")
            fetch(lat: 36.391, lon: 139.060)
        case .Ibaraki:
            print("茨城")
            fetch(lat: 36.342, lon: 140.447)
        }
    }
    
    func getWeatherIcon() -> String {
        let main = weather!.current.weather[0].main
        let weatherIcon:  String
        
        switch main {
        case "Clear":
            weatherIcon = "sun.min.fill"
            
        case "Clouds":
            weatherIcon = "cloud"
            
        case "Drizzle":
            weatherIcon = "cloud.drizzle"
            
        case "Rain":
            weatherIcon = "cloud.rain"
            
        case "Thunderstorm":
            weatherIcon = "cloud.bolt.rain"
            
        case "Snow":
            weatherIcon = "cloud.snow"
            
        default:
            weatherIcon = "carbon.monoxide.cloud"
        }
        
        return weatherIcon
    }
    
}
