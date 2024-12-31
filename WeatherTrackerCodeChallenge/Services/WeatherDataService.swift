//
//  WeatherDataService.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case networkError(Error)
    case unknownError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "The server response is invalid."
        case .invalidData:
            return "The data received from the server is invalid."
        case .networkError(let error):
            return error.localizedDescription
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}

protocol WeatherDataServiceProtocol {
    func getWeatherData(for city:  String) async throws -> WeatherData
}

class WeatherDataService: WeatherDataServiceProtocol {
    func getWeatherData(for city:  String) async throws -> WeatherData {
        guard let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=a01c21c2e5964819a51221058242712&q=\(city)&aqi=no") else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidData
            }

            let decoder = JSONDecoder()
            let weatherResponse = try decoder.decode(WeatherData.self, from: data)
            
            return weatherResponse
        } catch {
            throw APIError.invalidData
        }
    }
}
