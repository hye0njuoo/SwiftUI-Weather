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
        case .greetingButtonTapped:
            state.greeting = "You tapped the greeting button!" // 버튼 클릭 시 메시지 변경
            return .none
        }
    }
}
