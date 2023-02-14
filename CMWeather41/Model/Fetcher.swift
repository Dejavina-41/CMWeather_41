//
//  File.swift
//  CMWeather41
//
//  Created by cmStudent on 2023/02/12.
//

import Foundation

struct Fetcher {
    private let baseUrl =
"https://api.openweathermap.org/data/2.5/onecall?"
    private var settingUrl = "&appid=c26e8e9b5050610b5bd8b57610c61783&units=metric&exclude=minutely,alerts&lang=ja"
    
    func fetch(lat: Double, lon: Double, completion: @escaping (ResponseWeather) -> ()) {
        // "lat=35.689&lon=139.692"
        let url = baseUrl + "lat=\(lat)&lon=\(lon)" + settingUrl
        if let url = URL(string: url) {
            print("urlok")
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                print("sessionok")
                if error != nil {
                    print("エラー")
                    print(error!)
                }
                if let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data {
                    do {
                        let weather = try JSONDecoder().decode(ResponseWeather.self, from: data)
                        completion(weather)
                    } catch {
                        print("エラー")
                        print(error)
                    }
                }
            }
            .resume()
        } else {
            print("urlerror")
        }
    }
}
