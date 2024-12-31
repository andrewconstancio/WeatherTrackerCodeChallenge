//
//  WeatherDetailsView.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

struct WeatherDetailsView: View {
    let weatherData: WeatherData
    
    var body: some View {
        HStack {
            DetailItemView(title: "Humidity", value: "\(weatherData.current.humidity)%")
            Spacer()
            DetailItemView(title: "UV", value: "\(Int(weatherData.current.uv))")
            Spacer()
            DetailItemView(title: "Feels Like", value: "\(Int(weatherData.current.feelslike_f))\u{00B0}")
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black.opacity(0.1))
                .shadow(color: .white.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding(.horizontal, 60)
    }
}

//#Preview {
//    WeatherDetailsView()
//}
