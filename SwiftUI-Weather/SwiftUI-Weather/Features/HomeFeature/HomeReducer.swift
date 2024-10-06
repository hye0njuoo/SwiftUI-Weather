//
//  HomeReducer.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import ComposableArchitecture

struct HomeReducer: Reducer {
    func reduce(into state: inout HomeState, action: HomeAction) -> Effect<HomeAction> {
        switch action {
        case .hourlyForecast(let action):
            return HourlyForecastReducer().reduce(into: &state.hourlyForecast, action: action)
                .map(Action.hourlyForecast)

        case .tenDayForecast(let action):
                   return TenDayForecastReducer().reduce(into: &state.tenDayForecast, action: action)
                       .map(HomeAction.tenDayForecast) 

        }
    }
}
