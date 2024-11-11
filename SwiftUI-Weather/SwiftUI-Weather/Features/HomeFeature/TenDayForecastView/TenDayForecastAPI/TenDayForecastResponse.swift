//
//  TenDayForecastResponse.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 11/11/24.
//

import Foundation

struct TenDayForecastResponse: Codable {
    let data: ForecastData
}

struct ForecastData: Codable {
    let timelines: [Timeline]
}

struct Timeline: Codable {
    let timestep: String
    let endTime: String
    let startTime: String
    let intervals: [Interval]
}

struct Interval: Codable {
    let startTime: String
    let values: WeatherValues
}

struct WeatherValues: Codable {
    let precipitationProbability: Double
    let temperature: Double
    let temperatureMax: Double
    let temperatureMin: Double
    let weatherCodeFullDay: Int
}
