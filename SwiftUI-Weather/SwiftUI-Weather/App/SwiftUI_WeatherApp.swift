//
//  SwiftUI_WeatherApp.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct SwiftUI_WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: AppReducer.State(), reducer: {
                AppReducer()
            }))
        }
    }
}
