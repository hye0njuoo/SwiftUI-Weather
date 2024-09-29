//
//  MapReducer.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import ComposableArchitecture

struct MapReducer: Reducer {
    func reduce(into state: inout MapState, action: MapAction) -> Effect<MapAction> {
        switch action {
        case .greetingButtonTapped:
            state.greeting = "You tapped the greeting button!" // 버튼 클릭 시 메시지 변경
            return .none
        }
    }
}

