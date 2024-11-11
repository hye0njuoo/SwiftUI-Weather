//
//  TenDayForecastAPI.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 11/11/24.
//

import Foundation
import Moya

enum ForecastAPI {
    case fetchTenDayForecast
}

extension ForecastAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api.tomorrow.io/v4")!
    }

    var path: String {
        "/timelines"
    }

    var method: Moya.Method {
        .post
    }

    var task: Task {
        switch self {
        case .fetchTenDayForecast:
            let parameters: [String: Any] = [
                "location": "37.33, 127.01",
                "fields": ["temperature", "temperatureMax", "temperatureMin", "precipitationProbability", "weatherCodeFullDay"],
                "units": "metric",
                "timesteps": ["1d"],
                "startTime": "nowPlus1d",
                "endTime": "nowPlus5d"
            ]

            // Add the API key as a query parameter
            let apiKey = "w2esgeSS326FqRe5q7AalIjOKyixbaY7"
            let queryParameters: [String: Any] = [
                "apikey": apiKey
            ]

            return .requestCompositeParameters(bodyParameters: parameters, bodyEncoding: JSONEncoding.default, urlParameters: queryParameters)
        }
    }

    var headers: [String: String]? {
        return [
            "accept": "application/json",
            "Accept-Encoding": "gzip",
            "content-type": "application/json"
        ]
    }
}
