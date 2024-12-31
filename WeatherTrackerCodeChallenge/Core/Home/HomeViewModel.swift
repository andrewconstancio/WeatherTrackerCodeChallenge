//
//  HomeViewModel.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchedWeatherData: WeatherData?
    @Published var savedWeatherData: WeatherData?
    @Published var errorMessage: String?

    private var weatherDataService = WeatherDataService()
    private var cancellables = Set<AnyCancellable>()
    private var currentTask: Task<Void, Never>?
    private let userDefaultsKey = "weatherData"

    init() {
        addSubscribers()
        loadWeatherData()
    }

    private func addSubscribers() {
        $searchText
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] value in
                guard !value.isEmpty else { return }
                self?.fetchWeatherData()
            }
            .store(in: &cancellables)
    }

    func saveWeatherData() {
        guard let weatherData = searchedWeatherData else { return }
        
        do {
            let data = try JSONEncoder().encode(weatherData)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
            searchText = ""
            savedWeatherData = weatherData
        } catch {
            handle(error: error)
        }
    }

    func loadWeatherData() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else { return }
        
        do {
            savedWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
        } catch {
            handle(error: error)
        }
    }

    func fetchWeatherData() {
        currentTask?.cancel()

        guard !searchText.isEmpty else {
            searchedWeatherData = nil
            errorMessage = nil
            return
        }

        currentTask = Task {
            do {
                let data = try await weatherDataService.getWeatherData(for: searchText)
                DispatchQueue.main.async {
                    self.searchedWeatherData = data
                    self.errorMessage = nil
                }
            } catch {
                handle(error: error)
            }
        }
    }

    private func handle(error: Error) {
        DispatchQueue.main.async {
            if let weatherError = error as? APIError {
                self.errorMessage = weatherError.errorDescription
            } else {
                self.errorMessage = APIError.unknownError.errorDescription
            }
            self.searchedWeatherData = nil
        }
        print("Error: \(error.localizedDescription)")
    }
}
