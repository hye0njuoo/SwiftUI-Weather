//
//  TabbarView.swift
//  SwiftUI-Weather
//
//  Created by 성현주 on 9/29/24.
//

import SwiftUI
import ComposableArchitecture

enum Tab {
    case main, map, list
}

struct TabbarView: View {
    @State var selectedTab: Tab = .main
    let store: StoreOf<AppReducer>

    var body: some View {
        ZStack {
            switch selectedTab {
            case .main:
                HomeView(store: Store(initialState: HomeReducer.State(), reducer: {
                    HomeReducer()
                }))
            case .map:
                MapView(store: Store(initialState: MapReducer.State(), reducer: {
                    MapReducer()
                }))
            case .list:
                ListView(store: Store(initialState: ListReducer.State(), reducer: {
                    ListReducer()
                }))
            }
            CustomTabbarView(selectedTab: $selectedTab)
                .position(CGPoint(x: UIScreen.main.bounds.width / 2, y: 745.0))
        }
    }
}

struct CustomTabbarView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        VStack {
            Divider()
                .background(Color.white)
                .opacity(0.4)
                .padding(.bottom, 8)
            HStack {
                Button {
                    selectedTab = .map
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 27, height: 25)
                }.padding(.leading, 24)

                Spacer()
                Button {
                    selectedTab = .main
                } label: {
                    Image(systemName: "location.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 14, height: 13)
                }
                Button {
                    selectedTab = .main
                } label: {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.65))
                        .frame(width: 9, height: 9)
                }
                Spacer()

                Button {
                    selectedTab = .list
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 26, height: 25)
                }.padding(.trailing, 24)
            }.padding(.bottom, 5)
        }
        .background(Color.clear)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    TabbarView(store: Store(initialState: AppReducer.State(), reducer: {
        AppReducer()
    }))
}

