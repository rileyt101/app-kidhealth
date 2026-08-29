//
//  AllergyCreateView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergyCreateView: View {
    @ObservedObject var viewModel: AppViewModel
    // Use to exit view when successfully Confirming allergy.
    @Environment(\.dismiss) private var dismiss
    
    var sliderColor: Color {
        switch Int(viewModel.severitySliderValue) {
        case 0:
            return Severity.mild.color
        case 1:
            return Severity.moderate.color
        case 2:
            return Severity.strong.color
        case 3:
            return Severity.severe.color
        default:
            return Severity.mild.color
        }
    }
    
    var child: Child
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading) {
                    
                    // Allow SF Symbol to align in center
                    HStack {
                        Spacer()
                        Text(Image(systemName: "heart.text.clipboard"))
                            .font(.system(size: 64, weight: .bold))
                        Spacer()
                    }
                    // MARK: Input Fields
                    // --- ALLERGY NAME TEXT FIELD ---
                    Text("Allergy Name")
                        .font(.title2).bold()
                    
                    InputFieldStyling {
                        TextField("Name", text: $viewModel.nameField)
                    }
                    // --- SEVERITY SLIDER FIELD ---
                    Text("Severity")
                        .font(.title2).bold()
                    
                    InputFieldStyling {
                        VStack {
                            Slider(
                                value: $viewModel.severitySliderValue,
                                in: 0...3,
                                step: 1,
                                minimumValueLabel: Text(Image(systemName: "allergens.fill")).font(.caption),
                                maximumValueLabel: Text(Image(systemName: "exclamationmark.triangle.fill")).font(.caption),
                                label: {
                                }
                            )
                            .tint(sliderColor)
                            .textFieldStyle(.plain)
                            Text(viewModel.severityField.displayName)
                        }
                    }
                    
                    // --- MEDICATION TEXT FIELD ---
                    Text("Medication")
                        .font(.title2).bold()
                    
                    InputFieldStyling {
                        TextField("e.g. Epipen, Inhaler ...",
                                  text: $viewModel.medicationField)
                    }

                    // --- NOTES TEXT FIELD ---
                    Text("Additional Notes")
                        .font(.title2).bold()
                    InputFieldStyling {
                        TextField("Any specific details about this allergy?", text: $viewModel.notesField,
                                  axis: .vertical)
                    }
                    .lineLimit(4...6)
                }
                .padding(.horizontal, 16)
            }
            // MARK: Confirm Button
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Confirm") {
                        if viewModel.addAllergyEntry(child: child) {
                            dismiss()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .controlSize(.large)
                    .buttonStyle(.glassProminent)
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("Add \(child.name)'s Allergy")
        }
    }
}

#Preview {
    @StateObject @Previewable var viewModel: AppViewModel = AppViewModel()
    let child: Child = viewModel.getChildren().first!
    
    AllergyCreateView(viewModel: viewModel, child: child)
}

