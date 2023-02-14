//
//  ContentView.swift
//  CMWeather41
//
//  Created by cmStudent on 2023/02/12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.isLode {
            ProgressView()
        } else {
            ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        // 月、日付、時刻
                        Text(" \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                            .font(.title)
                            .padding()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        VStack(spacing: 20) {
                            
                            Text("気温")
                            Text(String(viewModel.weather!.current.temp) + "°")
                                .font(.system(size: 70))
                                .fontWeight(.bold)
                                .padding()
                            
                            Text(viewModel.weather!.current.weather[0].main)
                            Image(systemName: "sun.min.fill")
                                .font(.system(size: 100))
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("現在の天気")
                            .bold()
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "cloud.heavyrain", name: "降水確率", value: (String((viewModel.weather!.hourly[0].pop) * 100) + "%") )
                            Spacer()
                            WeatherRow(logo: "humidity", name: "湿度", value: (String(viewModel.weather!.current.humidity) + "%") )
                        }
                        HStack {
                            WeatherRow(logo: "wind", name: "風速", value: (String(viewModel.weather!.current.wind_speed) + "m/s") )
                            Spacer()
                            WeatherRow(logo: "smoke", name: "気圧", value: (String(viewModel.weather!.current.pressure) + "hPa") )
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 90)
                    .foregroundColor(.black)
                    .background(.white)
                    //.cornerRadius(20, corners: [.topLeft, .topRight])
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        NavigationView(viewModel: viewModel)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(.blue)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
