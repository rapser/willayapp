//
//  LoginViewModel.swift
//  willayapp
//
//  Created by miguel tomairo on 22/02/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func login() async throws {
        print("Logging user ...")
        try await AuthService.shared.login(withEmail: email,
                                           password: password)
    }
    
}
