//
//  Child.swift
//  a1-s4092817
//
//  Created by Riley Tran on 26/8/2026.
//

import Foundation

/**
Child.swift
Defines Child data structure, which represents a Child of the user.
A Child can have any amount of associated Allergies.
*/

// MARK: - Child struct
struct Child: Codable, Identifiable {
    var id = UUID()
    var name: String
    var allergies: [Allergy]?
}

