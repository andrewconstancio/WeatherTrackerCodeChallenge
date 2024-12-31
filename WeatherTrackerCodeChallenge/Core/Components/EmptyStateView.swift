//
//  EmptyStateView.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("No City Selected")
                .bold()
                .font(.system(size: 24))
            
            Text("Please Search For A City")
                .foregroundColor(.secondary)
                .font(.system(size: 16))
        }
    }
}

#Preview {
    EmptyStateView()
}
