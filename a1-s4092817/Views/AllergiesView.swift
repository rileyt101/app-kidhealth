//
//  AllergiesView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergiesView: View {
    var child: Child
    var body: some View {
        NavigationStack {
            Group {
                if let allergies = child.allergies, !allergies.isEmpty {
                    List(allergies) { allergy in
                        HStack {
                            Text(allergy.name)
                            Text(allergy.severity)
                            Text(allergy.medication)
                        }
                    }
                    .listStyle(.inset)
                }
            }
            .navigationTitle(child.name)
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

#Preview {
    AllergiesView(child: Child(name: "Amanda",
                            allergies: [Allergy(name: "Eggs", severity: "Severe", medication: "EpiPen"),
                                        Allergy(name: "Peanuts", severity: "Strong", medication: "EpiPen")]
                           ))
}
