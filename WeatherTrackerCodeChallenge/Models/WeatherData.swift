//
//  WeatherData.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import Foundation

struct WeatherData: Codable {
    let current: Current
    let location: Location
    
    struct Location: Codable {
        let name: String
    }
    
    struct Current: Codable {
        let temp_f: Double
        let condition: Condition
        let humidity: Int
        let uv: Double
        let feelslike_f: Double
    }
    
    struct Condition: Codable {
        let text: String
        let icon: String
    }
}
