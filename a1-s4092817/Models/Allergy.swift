//
//  Allergy.swift
//  a1-s4092817
//
//  Created by Riley Tran on 26/8/2026.
//

/**
Allergy.swift
Defines Allergy data structure, which represents a Child's Allergy and its associated trigger, severity and treatment information.
Also contains Severity enum, representing an Allergy's symptom severity.
*/

import Foundation
import SwiftUI

// MARK: - Allergy struct
struct Allergy: Codable, Identifiable {
    var id = UUID()
    var name: String
    var severity: String
    var medication: String
    var notes: String?
}

// MARK: - Severity enum
enum Severity: Int, Codable {
    case mild = 0
    case moderate = 1
    case strong = 2
    case severe = 3
    
    // Initialise from String
    init(fromString string: String) {
        switch string.lowercased() {
        case "mild": self = .mild
        case "moderate": self = .moderate
        case "strong": self = .strong
        case "severe": self = .severe
            
        default: self = .mild
        }
    }
    
    // Get String representation
    var displayName: String {
        switch self {
        case .mild: return "Mild"
        case .moderate: return "Moderate"
        case .strong: return "Strong"
        case .severe: return "Severe"
        }
    }
    
    // Get Color associated with Severity rating (from Assets)
    var color: SwiftUI.Color {
        switch self {
        case .mild: return Color("Mild")
        case .moderate: return Color("Moderate")
        case .strong: return Color("Strong")
        case .severe: return Color("Severe")
        }
    }
}
