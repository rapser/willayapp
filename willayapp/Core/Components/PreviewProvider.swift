//
//  PreviewProvider.swift
//  willayapp
//
//  Created by miguel tomairo on 25/02/25.
//

import SwiftUI

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(
        id: NSUUID().uuidString,
        fullname: "Miguel Angel",
        email: "migrapser@gmail.com",
        username: "rapser"
    )
}

extension User {
    static var testUser: User {
        DeveloperPreview.shared.user
    }
}
