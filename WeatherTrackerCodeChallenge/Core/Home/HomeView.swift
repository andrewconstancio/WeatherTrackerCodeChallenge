//
//  HomeView.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
     
     var body: some View {
         VStack {
             SearchBarView(searchText: $viewModel.searchText)
             
             if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                  .foregroundColor(.red)
                  .multilineTextAlignment(.center)
                  .padding(.horizontal, 20)
                  .padding(.top, 10)
              }
             
             if !viewModel.searchText.isEmpty {
                 if let weatherData = viewModel.searchedWeatherData {
                     WeatherDataView(weatherData: weatherData, isCompact: true)
                         .onTapGesture {
                             viewModel.saveWeatherData()
                         }
                 }
             } else {
                 if let savedWeatherData = viewModel.savedWeatherData {
                     WeatherDataView(weatherData: savedWeatherData, isCompact: false)
                 } else {
                     EmptyStateView()
                 }
             }
             
             Spacer()
         }
         .padding()
     }
}

#Preview {
    HomeView()
}
