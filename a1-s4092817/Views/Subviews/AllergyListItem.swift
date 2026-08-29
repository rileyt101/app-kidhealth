//
//  AllergyListItem.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergyListItem: View {
    var allergy: Allergy

    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(allergy.name)
                HStack {
                    SeverityGrading(severity: Severity(fromString: allergy.severity),
                                    size: 14)
                    Text(allergy.severity)
                        .opacity(0.6)
                    Spacer()
                }
            }
            Spacer()
            Text("Details")
                .foregroundStyle(Color.accentColor)
        }
    }
}

#Preview {
    AllergyListItem(allergy: Allergy(name: "Eggs",
                                     severity: "Severe",
                                     medication: "EpiPen"))
}
