//
//  ProfileViewModel.swift
//  willayapp
//
//  Created by miguel tomairo on 23/02/25.
//

import Combine

class ProfileViewModel: ObservableObject {

    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSuscribers()
    }
    
    private func setupSuscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("user in viewmodel from combine: \(String(describing: user))")
        }
        .store(in: &cancellables)
    }
}
