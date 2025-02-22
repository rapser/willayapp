//
//  NavigationRouter.swift
//  twitter-clone
//
//  Created by miguel tomairo on 19/02/25.
//

import SwiftUI

enum Destination: Hashable {
    case register
    case forgetPassword
    case feed
}

enum ModalType: Identifiable {
    case createThread
    case settings
    case profileEdit

    var id: String {
        switch self {
        case .createThread: return "createThread"
        case .settings: return "settings"
        case .profileEdit: return "profileEdit"
        }
    }
}


class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedModal: ModalType?

    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func presentModal(_ modal: ModalType) {
        presentedModal = modal
    }
    
    func dismissModal() {
        presentedModal = nil
    }
    
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func resetNavigation() {
        path = NavigationPath()
    }
}

