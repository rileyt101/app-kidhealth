//
//  InputField.swift
//  a1-s4092817
//
//  Created by Riley Tran on 29/8/2026.
//

/**
InputFieldStyling.swift
Reusable Wrapper that allows a View to be styling consistently.
Used for input fields in AllergyCreateView
*/

import SwiftUI

struct InputFieldStyling<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    // MARK: - Styling
    var body: some View {
        content
            .textFieldStyle(.plain)
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
            .padding(.bottom, 20)
    }
}
