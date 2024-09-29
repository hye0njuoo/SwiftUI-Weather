//
//  MapView.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import SwiftUI
import ComposableArchitecture

struct MapView: View {
    let store: StoreOf<MapReducer> 

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text(viewStore.greeting)
                    .font(.title)
                    .padding()

                Button("Tap me!") {
                    viewStore.send(.greetingButtonTapped) // 버튼 클릭 시 액션 전송
                }
                .padding()
            }
        }
    }
}
#Preview {
    MapView(store: Store(initialState: MapReducer.State(), reducer: {
        MapReducer()
    }))
}

