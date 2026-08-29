//
//  Allergy.swift
//  a1-s4092817
//
//  Created by Riley Tran on 26/8/2026.
//

import Foundation
import SwiftUI

struct Allergy: Codable, Identifiable {
    var id = UUID()
    var name: String
    var severity: String
    var medication: String
    var notes: String?
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
    
    init(fromString string: String) {
        switch string.lowercased() {
        case "mild": self = .mild
        case "moderate": self = .moderate
        case "strong": self = .strong
        case "severe": self = .severe
            
        default: self = .mild
        }
    }
    
    var color: SwiftUI.Color {
        switch self {
        case .mild: return Color("Mild")
        case .moderate: return Color("Moderate")
        case .strong: return Color("Strong")
        case .severe: return Color("Severe")
        }
    }
}
