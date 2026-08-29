//
//  AllergyCreateView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergyCreateView: View {
    @ObservedObject var viewModel: AppViewModel
    @Environment(\.dismiss) private var dismiss
    var child: Child
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading){
                
                // Allow SF Symbol to align in center
                HStack {
                    Spacer()
                    Text(Image(systemName: "heart.text.clipboard"))
                        .font(.system(size: 64, weight: .bold))
                    Spacer()
                }
                
                // --- ALLERGY NAME TEXT FIELD ---
                Text("Allergy Name")
                    .font(.title2).bold()
                
                TextField("Name", text: $viewModel.nameField)
                    .textFieldStyle(.plain)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                    .padding(.bottom, 20)
                // --- SEVERITY SLIDER FIELD ---
                Text("Severity")
                    .font(.title2).bold()
                
                TextField("Severity", text:
                            $viewModel.severityField)
                .textFieldStyle(.plain)
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                .padding(.bottom, 20)
                
                // --- SEVERITY TEXT FIELD ---
                Text("Medication")
                    .font(.title2).bold()
                
                TextField("Medication", text:
                            $viewModel.medicationField)
                .textFieldStyle(.plain)
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                .padding(.bottom, 20)
                
                // --- NOTES TEXT FIELD ---
                Text("Additional Notes")
                    .font(.title2).bold()
                TextField("Notes", text:
                            $viewModel.notesField)
                .textFieldStyle(.plain)
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                .padding(.bottom, 20)
                
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

