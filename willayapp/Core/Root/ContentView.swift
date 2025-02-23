//
//  ContentView.swift
//  willayapp
//
//  Created by miguel tomairo on 22/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var router = NavigationRouter()
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
                
        Group {
//            Text("hola")
//                .onAppear {
//                    AuthService.shared.signOut()
//                }
            
            if viewModel.userSession != nil {
                MainTabView()
                    .environmentObject(router)
            }else {
                LoginView()
                    .environmentObject(router)
            }
        }
    }
}

#Preview {
    ContentView()
}
