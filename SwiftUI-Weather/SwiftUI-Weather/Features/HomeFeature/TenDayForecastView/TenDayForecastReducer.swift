//
//  TenDayForecastReducer.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 10/6/24.
//

import Foundation
import ComposableArchitecture
import Moya

// 모델 정의
struct DailyForecast: Equatable, Identifiable {
    var id = UUID()
    var day: String
    var high: Int
    var low: Int
    var weatherIcon: String
}

// 상태 정의
struct TenDayForecastState: Equatable {
    var dailyForecasts: [DailyForecast] = []
}

// 액션 정의
enum TenDayForecastAction: Equatable {
    case loadForecasts
    case forecastsResponse(Result<[DailyForecast], Never>)
}

// 리듀서 정의
struct TenDayForecastReducer: Reducer {
    func reduce(into state: inout TenDayForecastState, action: TenDayForecastAction) -> Effect<TenDayForecastAction> {
        switch action {
        case .loadForecasts:
            return .run { send in
                let provider = MoyaProvider<ForecastAPI>()
                do {
                    let response = try await request(provider, target: .fetchTenDayForecast)
                    let decoder = JSONDecoder()
                    let forecastResponse = try decoder.decode(TenDayForecastResponse.self, from: response.data)
                    let forecasts = mapForecastResponseToDailyForecasts(forecastResponse)
                    await send(.forecastsResponse(.success(forecasts)))
                } catch {
                    //await send(.forecastsResponse(.failure(error)))
                }
            }

        case let .forecastsResponse(.success(forecasts)):
            state.dailyForecasts = forecasts
            return .none

        case let .forecastsResponse(.failure(error)):
            print("Forecast loading failed with error: \(error)")
            return .none
        }
    }

    // 서버 응답을 모델로 변환하는 함수
    private func mapForecastResponseToDailyForecasts(_ response: TenDayForecastResponse) -> [DailyForecast] {
        response.data.timelines.first?.intervals.compactMap { interval in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E" // 요일 형식
            let date = ISO8601DateFormatter().date(from: interval.startTime) ?? Date()
            let day = dateFormatter.string(from: date)

            return DailyForecast(
                day: day,
                high: Int(interval.values.temperatureMax),
                low: Int(interval.values.temperatureMin),
                weatherIcon: mapWeatherCodeToIcon(interval.values.weatherCodeFullDay)
            )
        } ?? []
    }

    // 날씨 코드를 아이콘으로 변환하는 함수
    private func mapWeatherCodeToIcon(_ code: Int) -> String {
        switch code {
        case 1000:
            return "sun.max.fill" // 맑은 날씨
        case 1001:
            return "cloud.fill" // 흐림
        case 1100:
            return "cloud.sun.fill" // 구름 조금
        case 1101:
            return "cloud.sun" // 대부분 구름 많음
        default:
            return "questionmark" // 기본 아이콘
        }
    }

    // Moya 비동기 요청 함수
    private func request(_ provider: MoyaProvider<ForecastAPI>, target: ForecastAPI) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                    print("성공 : \(response)")
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
