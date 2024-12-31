//
//  WeatherTrackerCodeChallengeApp.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

@main
struct WeatherTrackerCodeChallengeApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
