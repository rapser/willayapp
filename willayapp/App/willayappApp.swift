//
//  willayappApp.swift
//  willayapp
//
//  Created by miguel tomairo on 20/02/25.
//

import SwiftUI

@main
struct willayappApp: App {
    @StateObject private var router = NavigationRouter()

    var body: some Scene {
        
        WindowGroup {
            MainTabView()
                .environmentObject(router)
        }
    }
}
