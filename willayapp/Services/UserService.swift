//
//  UserService.swift
//  willayapp
//
//  Created by miguel tomairo on 23/02/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("user is: \(user)")
    }
    
    func reset() {
        self.currentUser = nil
    }
}
