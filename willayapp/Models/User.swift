//
//  User.swift
//  willayapp
//
//  Created by miguel tomairo on 23/02/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
    
}
