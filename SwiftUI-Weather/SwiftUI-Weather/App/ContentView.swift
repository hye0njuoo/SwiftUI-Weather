//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import SwiftUI
import ComposableArchitecture

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<AppReducer>
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabbarView(store: store)
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: AppReducer.State(), reducer: {
        AppReducer()
    }))
}
