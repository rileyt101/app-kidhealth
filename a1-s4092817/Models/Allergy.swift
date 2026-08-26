//
//  Allergy.swift
//  a1-s4092817
//
//  Created by Riley Tran on 26/8/2026.
//

import Foundation

struct Allergy: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String?
    var severity: String
    var medication: String
}

enum Severity: Int, Codable {
    case mild = 0
    case moderate = 1
    case strong = 2
    case severe = 3
    
    var displayName: String {
        switch self {
        case .mild: return "Mild"
        case .moderate: return "Moderate"
        case .strong: return "Strong"
        case .severe: return "Severe"
        }
    }
}
