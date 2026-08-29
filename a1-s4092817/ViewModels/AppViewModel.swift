//
//  HomeViewModel.swift
//  a1-s4092817
//
//  Handles all of the prototypes' logic (creating and modifying allergy data).
//  Created by Riley Tran on 28/8/2026.
//

import SwiftUI
import Combine


final class AppViewModel: ObservableObject {
    
    // MARK: - States
    @Published private(set) var children: [Child] = childrenData
    
    // MARK: - Allergy entry fields
    @Published var nameField: String = ""
    @Published var severityField: String = ""
    @Published var medicationField: String = ""
    @Published var notesField: String = ""
    
    @Published var currentChild: Child?
    
    // MARK: - Derived values
    var alphabeticallyOrderedChildren: [Child] {
        let sorted = children.sorted { $0.name < $1.name }
        return sorted
    }
    
    // MARK: - Getters and setters
    func getChildren() -> [Child] {
        return children
    }
    
    // Used for Preview testing
    func getChildByName(name: String) -> Child {
        return children.first(where: { $0.name == name })!
    }
    
    func addAllergyEntry(child: Child) -> Bool {
        guard let childIndex = children.firstIndex(where: { $0.id == child.id }) else {
            return false
        }
        
        if (nameField.isEmpty) {
            return false
        }
        else {
            let newAllergy = Allergy(name: nameField,
                                     severity: severityField,
                                     medication: medicationField,
                                     notes: notesField)
            children[childIndex].allergies = (children[childIndex].allergies ?? []) + [newAllergy]
            return true
        }  
    }
    
    // MARK: - Functions for Allergy Creation page logic
    func resetInputFields() {
        nameField = ""
        severityField = ""
        medicationField = ""
        nameField = ""
    }
}
