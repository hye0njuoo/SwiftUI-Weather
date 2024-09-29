//
//  AppReducer.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import ComposableArchitecture

struct AppReducer: Reducer {
    struct State: Equatable {
        var homeState = HomeReducer.State() // HomeReducer.State로 초기화
    }

    enum Action: Equatable {
        case home(HomeReducer.Action) // 홈 리듀서 액션 사용
    }

    var body: some Reducer<State, Action> {
        Scope(state: \.homeState, action: /Action.home) {
            HomeReducer() // 홈 리듀서 연결
        }
    }
}


