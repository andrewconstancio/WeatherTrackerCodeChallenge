//
//  DetailItemView.swift
//  WeatherTrackerCodeChallenge
//
//  Created by Andrew Constancio on 12/30/24.
//

import SwiftUI

struct DetailItemView: View {
    let title: String
    let value: String

    var body: some View {
         VStack {
             Text(title)
                 .foregroundColor(.secondary)
             Text(value)
                 .bold()
         }
    }
}

//#Preview {
//    DetailItemView()
//}
