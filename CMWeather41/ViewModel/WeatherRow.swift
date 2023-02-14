//
//  WeatherRow.swift
//  CMWeather41
//
//  Created by cmStudent on 2023/02/13.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    
                
                Text(value)
                    .bold()
                    .font(.headline)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "気温", value: "8°")
    }
}
