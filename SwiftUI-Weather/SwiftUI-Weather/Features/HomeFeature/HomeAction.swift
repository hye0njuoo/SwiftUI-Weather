//
//  HomeAction.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import Foundation

// 도메인 + 액션
enum HomeAction: Equatable {
    case hourlyForecast(HourlyForecastReducer.Action)
}

