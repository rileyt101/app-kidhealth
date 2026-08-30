//
//  AllergyDetailView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

/**
AllergyDetailView.swift
View that displays a particular Allergy in more detail.
*/

import SwiftUI

struct AllergyDetailView: View {
    // MARK: - Passed parameters
    var child: Child
    var allergy: Allergy
    
    // MARK: - View Content
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                // -- NAME --
                Text("\(allergy.name)")
                    .font(.title).bold()
                
                // -- SEVERITY --
                HStack {
                    SeverityGrading(severity: Severity(fromString: allergy.severity),
                                    size: 14)
                    
                    Text("\(allergy.severity)")
                        .opacity(0.6)
                    
                    Spacer()
                }
                .padding(.bottom, 100)
                
                // -- MEDICATION --
                Text("Medication")
                    .font(.title2).bold()
                Text("\(allergy.medication)")
                    .padding(.bottom, 48)
                
                // -- NOTES --
                Text("Notes")
                    .font(.title2).bold()
                Text("\(allergy.notes ?? "None")")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            
            .navigationTitle("\(child.name)'s Allergies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let child: Child = Child(name: "Amanda",
                             allergies: [Allergy(name: "Eggs", severity: "Severe", medication: "EpiPen"),
                                         Allergy(name: "Peanuts", severity: "Strong", medication: "EpiPen")])
                             
     let allergy: Allergy = Allergy(name: "Eggs",
                                    severity: "Severe",
                                    medication: "EpiPen")
    NavigationStack {
        AllergyDetailView(child: child,
                          allergy: allergy)
    }
}
