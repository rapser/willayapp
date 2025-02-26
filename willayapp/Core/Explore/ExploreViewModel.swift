//
//  ExploreViewModel.swift
//  willayapp
//
//  Created by miguel tomairo on 23/02/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
    
}
