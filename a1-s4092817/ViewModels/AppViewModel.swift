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
}
