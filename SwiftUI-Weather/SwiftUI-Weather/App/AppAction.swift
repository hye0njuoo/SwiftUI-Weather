//
//  AppAction.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import ComposableArchitecture

enum AppAction: Equatable {
    case home(HomeAction) // HomeAction을 HomeReducer.Action으로 변경
}

