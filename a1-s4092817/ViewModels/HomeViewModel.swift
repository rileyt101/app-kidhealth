//
//  HomeViewModel.swift
//  a1-s4092817
//
//  Created by Riley Tran on 28/8/2026.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    // MARK: - States
    
    @Published private(set) var children: [Child] = childrenData
    
    // MARK: - Derived values
    var alphabeticallyOrderedChildren: [Child] {
        let sorted = children.sorted { $0.name < $1.name }
        
        return sorted
    }
}
