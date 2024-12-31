//
//  WeatherIconView.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

struct WeatherIconView: View {
    let iconURL: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: "https:\(iconURL)")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            case .failure:
                Text("Failed to load image")
                    .font(.caption)
                    .foregroundColor(.secondary)
            @unknown default:
                EmptyView()
            }
        }
    }
}

//#Preview {
//    WeatherIconView()
//}
