//
//  HourlyForecastView.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import SwiftUI
import ComposableArchitecture

struct HourlyForecastView: View {
    let store: StoreOf<HourlyForecastReducer>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                Text(viewStore.summary)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, 17)
                Divider()
                    .background(.white)
                    .opacity(0.4)
                    .padding(.bottom, 8)
                ScrollView(.horizontal, showsIndicators: false) {

                    HStack(spacing: 30) {
                        ForEach(viewStore.forecasts, id: \.self) { forecast in
                            VStack(spacing: 20) {
                                Text(forecast.time)
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                Image(systemName: forecast.iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                Text("\(forecast.temperature)°")
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal, 17)
                }


            }
            .padding(.vertical, 10)
            .frame(width: 335, height: 212)
            .background(.white.opacity(0.03))

            .cornerRadius(15)

            .onAppear {
                viewStore.send(.loadForecasts)
            }
        }
    }
}

#Preview {
    HourlyForecastView(store: Store(initialState: HourlyForecastReducer.State(), reducer: {
        HourlyForecastReducer()
    }))
}
