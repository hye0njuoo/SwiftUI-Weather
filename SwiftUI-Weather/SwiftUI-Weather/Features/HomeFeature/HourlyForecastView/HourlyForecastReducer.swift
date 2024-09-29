//
//  HourlyForecastReducer.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import ComposableArchitecture
import Foundation

struct HourlyForecast: Equatable, Identifiable, Hashable {
    let id = UUID()
    let time: String
    let iconName: String
    let temperature: Int
}

struct HourlyForecastReducer: Reducer {
    struct State: Equatable {
        var forecasts: [HourlyForecast] = []
        var summary: String = "Cloudy conditions from 1AM-9AM, with\nshowers expected at 9AM."
    }

    enum Action: Equatable {
        case loadForecasts
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .loadForecasts:
            //임의로 넣어놓은 덤더러 덤덤 더미 입니다~
            state.forecasts = [
                HourlyForecast(time: "10PM", iconName: "cloud.moon.fill", temperature: 21),
                HourlyForecast(time: "11PM", iconName: "cloud.moon.fill", temperature: 21),
                HourlyForecast(time: "12AM", iconName: "cloud.moon.fill", temperature: 19),
                HourlyForecast(time: "1AM", iconName: "cloud.moon.fill", temperature: 19),
                HourlyForecast(time: "2AM", iconName: "moon.stars.fill", temperature: 18),
                HourlyForecast(time: "3AM", iconName: "cloud.moon.fill", temperature: 19),
                HourlyForecast(time: "4AM", iconName: "cloud.moon.fill", temperature: 19),
                HourlyForecast(time: "5AM", iconName: "cloud.moon.fill", temperature: 19),
                HourlyForecast(time: "6AM", iconName: "cloud.moon.fill", temperature: 20),
                HourlyForecast(time: "7AM", iconName: "cloud.sun.fill", temperature: 21),
                HourlyForecast(time: "8AM", iconName: "cloud.sun.fill", temperature: 21),
                HourlyForecast(time: "9AM", iconName: "cloud.sun.fill", temperature: 21)
            ]
            return .none
        }
    }
}
