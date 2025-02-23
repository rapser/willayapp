//
//  RegisterViewModel.swift
//  willayapp
//
//  Created by miguel tomairo on 22/02/25.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullname: String = ""
    @Published var username: String = ""
    
    @MainActor
    func createUser() async throws {
        print("Creating user ...")
        try await AuthService.shared.createUser(withEmail: email,
                                      password: password,
                                      fullname: fullname,
                                      username: username)
        
    }
    
}
