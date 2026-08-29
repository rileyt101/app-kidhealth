//
//  SeverityGrading.swift
//  a1-s4092817
//
//  Created by Riley Tran on 30/8/2026.
//

import SwiftUI

struct SeverityGrading: View {
    let severity: Severity
    let size: Int
    
    let totalDots: Int = 4
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalDots, id: \.self) { index in
                Circle()
                    .fill(severity.rawValue >= index ? severity.color : .gray)
                    .frame(width: CGFloat(size), height: CGFloat(size))
            }
        }
    }
}


#Preview {
    SeverityGrading(severity: .strong, size: 20)
}
