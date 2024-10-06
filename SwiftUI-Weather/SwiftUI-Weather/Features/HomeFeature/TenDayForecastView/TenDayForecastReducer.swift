//
//  TenDayForecastReducer.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 10/6/24.
//

import Foundation
import ComposableArchitecture

struct DailyForecast: Equatable, Identifiable, Hashable {
    var id = UUID()
    var day: String
    var high: Int
    var low: Int
    var weatherIcon: String
}

struct TenDayForecastState: Equatable {
    var dailyForecasts: [DailyForecast] = []
}

enum TenDayForecastAction: Equatable {
    case loadForecasts
}


struct TenDayForecastReducer: Reducer {
    func reduce(into state: inout TenDayForecastState, action: TenDayForecastAction) -> Effect<TenDayForecastAction> {
        switch action {
        case .loadForecasts:
            state.dailyForecasts = [
                DailyForecast(day: "오늘", high: 19, low: 11, weatherIcon: "cloud.fill"),
                DailyForecast(day: "월", high: 22, low: 13, weatherIcon: "cloud"),
                DailyForecast(day: "화", high: 19, low: 11, weatherIcon: "cloud.fill"),
                DailyForecast(day: "수", high: 22, low: 13, weatherIcon: "cloud.moon.fill"),
                DailyForecast(day: "목", high: 19, low: 11, weatherIcon: "sun.max.fill"),
                DailyForecast(day: "금", high: 22, low: 13, weatherIcon: "cloud.sun.fill"),
                DailyForecast(day: "토", high: 19, low: 11, weatherIcon: "cloud.fill"),
                DailyForecast(day: "일", high: 22, low: 13, weatherIcon: "cloud.sun.fill"),
            ]
            return .none
        }
    }
}
