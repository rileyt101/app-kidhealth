//
//  AllergiesView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergiesView: View {
    var child: Child
    
    var viewTitle: String {
        child.name + "'s Allergies"
    }

    var body: some View {
        NavigationStack {
            VStack {
                if let allergies = child.allergies, !allergies.isEmpty {
                    List {
                        ForEach(allergies) { allergy in
                            NavigationLink(destination: AllergyDetailView(allergy: allergy)) {
                                AllergyListItem(allergy: allergy)
                            }
                        }
                    }
                    .listStyle(.inset)
                }
                NavigationLink(destination:
                                AllergyCreateView()) {
                        Text("+ Add Allergy")
                }
            }
            .navigationTitle(viewTitle)
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
