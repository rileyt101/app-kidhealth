//
//  AllergyDetailView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergyDetailView: View {
    var allergy: Allergy
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AllergyDetailView(allergy: Allergy(name: "Eggs",
                                       severity: "Severe",
                                       medication: "EpiPen"))
}
