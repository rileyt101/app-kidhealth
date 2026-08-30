//
//  HomeViewModel.swift
//  a1-s4092817
//
//  Created by Riley Tran on 28/8/2026.
//

/**
AppViewModel.swift
Handles ALL of the app's logic (creating and modifying allergy data), returning Child data to HomeView
 
The app's scope allows for a single ViewModel to be made (without this file being too convoluted)
*/

import SwiftUI
import Combine

final class AppViewModel: ObservableObject {
    
    // MARK: - Stored user data
    @Published private(set) var children: [Child] = childrenData
    
    // MARK: - Allergy entry fields
    @Published var nameField: String = ""
    @Published var severityField: Severity = .mild
    @Published var medicationField: String = ""
    @Published var notesField: String = ""
    
    @Published var severitySliderValue: Double = 0.0 {
        didSet {
            let clamped = Int(severitySliderValue.rounded())
            severityField = Severity(rawValue: clamped) ?? .mild
        }
    }
    
    // MARK: - Getters and setters
    // Get Child via name a-z
    var alphabeticallyOrderedChildren: [Child] {
        let sorted = children.sorted { $0.name < $1.name }
        return sorted
    }
    
    // Add Allergy to Child
    func addAllergyEntry(child: Child) -> Bool {
        // Make sure child exists (it should, since Child is only passed here via app on a existing Child struct)
        guard let childIndex = children.firstIndex(where: { $0.id == child.id }) else {
            return false
        }
        
        // Auto-fill empty fields
        if (nameField.isEmpty) {
            nameField = "Unknown"
        }
        if (medicationField.isEmpty) {
            medicationField = "None"
        }
        if (notesField.isEmpty) {
            notesField = "None"
        }
        
        let newAllergy = Allergy(name: nameField,
                                 severity: severityField.displayName,
                                 medication: medicationField,
                                 notes: notesField)
        children[childIndex].allergies = (children[childIndex].allergies ?? []) + [newAllergy]
        return true
    }
    
    // MARK: - Functions for Allergy Creation page logic
    func resetInputFields() {
        nameField = ""
        severityField = .mild
        medicationField = ""
        notesField = ""
        
        severitySliderValue = 0.0
    }
}
