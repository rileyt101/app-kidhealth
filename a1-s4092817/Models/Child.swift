//
//  Child.swift
//  a1-s4092817
//
//  Created by Riley Tran on 26/8/2026.
//

import Foundation

struct Child: Codable, Identifiable {
    var id = UUID()
    var name: String
    var allergies: [Allergy]?
}

