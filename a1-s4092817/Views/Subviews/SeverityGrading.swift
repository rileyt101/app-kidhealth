//
//  SeverityGrading.swift
//  a1-s4092817
//
//  Created by Riley Tran on 30/8/2026.
//

import SwiftUI
/**
SeverityGrading.swift
Subview that displays an Allergy's Severity using colour.
*/
struct SeverityGrading: View {
    let severity: Severity
    let size: Int
    
    let totalDots: Int = 4
    
    var body: some View {
        HStack(spacing: 4) {
            // Num. of dots filled relative to Severity; enabled by Severity raw value being an Int
            ForEach(0..<totalDots, id: \.self) { index in
                Circle()
                    .fill(severity.rawValue >= index ? severity.color : .gray)
                    .frame(width: CGFloat(size), height: CGFloat(size))
            }
        }
    }
}


#Preview {
    SeverityGrading(severity: .mild, size: 20)
    SeverityGrading(severity: .moderate, size: 20)
    SeverityGrading(severity: .strong, size: 20)
    SeverityGrading(severity: .severe, size: 20)
}
