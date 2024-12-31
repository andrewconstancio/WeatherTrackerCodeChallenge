//
//  WeatherDataView.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

struct WeatherDataView: View {
    let weatherData: WeatherData
    let isCompact: Bool
     
     var body: some View {
         VStack {
             if isCompact {
                 HStack {
                     VStack(alignment: .leading, spacing: 8) {
                         Text(weatherData.location.name)
                             .bold()
                             .font(.system(size: 20))
                         
                         Text("\(Int(weatherData.current.temp_f))\u{00B0}")
                             .bold()
                             .font(.system(size: 34))
                     }
                     Spacer()
                     WeatherIconView(iconURL: weatherData.current.condition.icon, size: 50)
                 }
                 .padding(16)
                 .background(
                     RoundedRectangle(cornerRadius: 16)
                         .fill(Color.black.opacity(0.1))
                         .shadow(color: .white.opacity(0.15), radius: 10, x: 0, y: 0)
                 )
                 .padding(.horizontal, 20)
             } else {
                 WeatherIconView(iconURL: weatherData.current.condition.icon, size: 200)
                 Text(weatherData.location.name)
                     .bold()
                     .font(.system(size: 24))
                 
                 Text("\(Int(weatherData.current.temp_f))\u{00B0}")
                     .bold()
                     .font(.system(size: 34))
                 
                 WeatherDetailsView(weatherData: weatherData)
             }
         }
     }
 }

//#Preview {
//    WeatherDataView()
//}
