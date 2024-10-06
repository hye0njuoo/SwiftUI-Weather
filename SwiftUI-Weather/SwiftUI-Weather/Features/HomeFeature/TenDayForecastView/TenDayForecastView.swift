//
//  TenDayForecastView.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 10/6/24.
//

import SwiftUI
import ComposableArchitecture

struct TenDayForecastView: View {
    let store: StoreOf<TenDayForecastReducer>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                Text("10일간의 일기예보")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, 17)

                Divider()
                    .background(.white)
                    .opacity(0.4)
                    .padding(.bottom, 8)

                VStack(spacing: 0) {
                    ForEach(viewStore.dailyForecasts, id: \.self) { forecast in
                        HStack {
                            Text(forecast.day)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(width: 55, alignment: .leading)

                            Image(systemName: forecast.weatherIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .symbolRenderingMode(.multicolor)
                                .foregroundColor(.white)

                            Spacer()

                            Text("\(forecast.low)°")
                                .font(.system(size: 18))
                                .foregroundColor(.white)

                            ZStack {
                                Capsule()
                                    .frame(width: 100, height: 4)
                                    .foregroundColor(.black)

                                Capsule()
                                    .frame(width: CGFloat((forecast.high - forecast.low) * 4), height: 4)
                                    .foregroundColor(.green)
                            }

                            Text("\(forecast.high)°")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 17)
                        .frame(height: 30)

                        if forecast != viewStore.dailyForecasts.last {
                            Divider()
                                .background(.white)
                                .opacity(0.3)
                                .padding(.vertical, 5)
                        }
                    }
                }
                .cornerRadius(15)
            }
            .padding(.vertical, 10)
            .frame(width: 335)
            .background(.white.opacity(0.03))
            .cornerRadius(15)

            .onAppear {
                viewStore.send(.loadForecasts)
            }
        }
    }
}


#Preview {
    TenDayForecastView(store: Store(initialState: TenDayForecastState(), reducer: {
        TenDayForecastReducer()
    }))
}
