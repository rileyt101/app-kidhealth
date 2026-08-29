//
//  AllergyCreateView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergyCreateView: View {
    @ObservedObject var viewModel: AppViewModel
    var child: Child
    var body: some View {
        NavigationStack {
            VStack {

                    TextField("Name", text: $viewModel.nameField)
                        .textFieldStyle(.roundedBorder)

                TextField("Severity", text:
                            $viewModel.severityField)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Medication", text:
                            $viewModel.medicationField)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
                Button("Add") {
                    if viewModel.addAllergyEntry(child: child) {
                        dismiss()
                    }
                }
                .buttonSizing(ButtonSizing.flexible)
                .controlSize(ControlSize.large)
                .buttonStyle(.glassProminent)
            }
            .padding(.horizontal, 16)
            .navigationTitle("Add Allergy")
        }
    }
}

#Preview {
    @StateObject @Previewable var viewModel: AppViewModel = AppViewModel()
    let child: Child = viewModel.getChildren().first!
    
    AllergyCreateView(viewModel: viewModel, child: child)
}

