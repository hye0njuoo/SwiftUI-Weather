//
//  HomeView.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeReducer> // 홈 리듀서를 사용하는 스토어

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Image("SeoulBG")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        Text(viewStore.location)
                            .font(.system(size: 37))
                            .foregroundStyle(.white)
                            .padding(.top, 34)

                        Text(" \(viewStore.temparature)°")
                            .font(.system(size: 102))
                            .fontWeight(.thin)
                            .foregroundStyle(.white)

                        Text(viewStore.weather)
                            .font(.system(size: 24))
                            .foregroundStyle(.white)

                        HStack(spacing: 12) {
                            Text("H:\(viewStore.high)°")
                                .font(.system(size: 21))
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                            Text("L:\(viewStore.low)°")
                                .font(.system(size: 21))
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }

                        HourlyForecastView(store: store.scope(state: \.hourlyForecast, action: HomeReducer.Action.hourlyForecast))
                            .padding(.top, 20)

                        TenDayForecastView(store: store.scope(state: \.tenDayForecast, action: HomeAction.tenDayForecast))
                            .padding(.top, 20)
                    }
                }
            }
            .onAppear {
                viewStore.send(.hourlyForecast(.loadForecasts))
                viewStore.send(.tenDayForecast(.loadForecasts))
            }
        }
    }
}

#Preview {
    HomeView(store: Store(initialState: HomeReducer.State(), reducer: {
        HomeReducer()
    }))
}
