//
//  HomeState.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import Foundation

// 도메인 + 상태
struct HomeState: Equatable {
    var greeting: String = "여기는 홈 탭"
    var location: String = "Seongnam-si"
    var temparature: Int = 21
    var weather: String = "Partly Cloudy"
    var high: Int = 29
    var low: Int = 15
    var hourlyForecast: HourlyForecastReducer.State = HourlyForecastReducer.State()
    var tenDayForecast: TenDayForecastState = TenDayForecastState()
}

