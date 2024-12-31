//
//  SearchBarView.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            TextField("Search Location", text: $searchText)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(.white)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? .black.opacity(0.5): .white
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.black.opacity(0.1))
                .shadow(color: .white.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
