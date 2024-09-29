//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<AppReducer> 
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView {
                MapView(store: Store(initialState: MapReducer.State(), reducer: {
                    MapReducer()
                }))
                .tabItem {
                    Label("list", systemImage: "map")
                }
                HomeView(store: Store(initialState: HomeReducer.State(), reducer: {
                    HomeReducer()
                }))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

                ListView(store: Store(initialState: ListReducer.State(), reducer: {
                    ListReducer()
                }))
                .tabItem {
                    Label("list", systemImage: "list.bullet")
                }

            }
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: AppReducer.State(), reducer: {
        AppReducer()
    }))
}
