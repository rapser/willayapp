//
//  ProfileThreadFilter.swift
//  willayapp
//
//  Created by miguel tomairo on 20/02/25.
//

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    @inlinable var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
}
