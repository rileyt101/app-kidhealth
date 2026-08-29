//
//  InputField.swift
//  a1-s4092817
//
//  Created by Riley Tran on 29/8/2026.
//

import SwiftUI

struct InputFieldStyling<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

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
