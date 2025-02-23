//
//  ContentViewModel.swift
//  willayapp
//
//  Created by miguel tomairo on 22/02/25.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSuscribers()
    }
    
    private func setupSuscribers() {
        
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}

