//
//  MainTabView.swift
//  twitter-clone
//
//  Created by miguel tomairo on 20/02/25.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    @EnvironmentObject var router: NavigationRouter

    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                }
                .tag(0)

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)

            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .tag(2)

            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                }
                .tag(3)

            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                }
                .tag(4)
        }
        .tint(.black)
        .onChange(of: selectedTab) { oldValue, newValue in
            if newValue == 2 {
                router.presentModal(.createThread)

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    selectedTab = 0
                }
            }
        }
        .sheet(item: $router.presentedModal) { modalType in
            switch modalType {
            case .createThread:
                CreateThreadView()
            case .settings, .profileEdit:
                EmptyView()
            }
        }
    }
}


#Preview {
    MainTabView()
        .environmentObject(NavigationRouter())
}
