//
//  AllergiesView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

/**
AllergiesView.swift
View that displays a Child's list of Allergies.
*/

import SwiftUI

struct AllergiesView: View {
    // MARK: - Passed parameters
    @ObservedObject var viewModel: AppViewModel
    var child: Child

    // MARK: - View Content
    var body: some View {
        VStack {
            // Create each list item based on Allergy list; leads to AllergyDetailView
            if let allergies = child.allergies, !allergies.isEmpty {
                List {
                    ForEach(allergies) { allergy in
                        NavigationLink(destination: AllergyDetailView(child: child,                                allergy: allergy)) {
                            AllergyListItem(allergy: allergy)
                        }
                    }
                }
                .listStyle(.inset)
            }
            // Empty state; Child has no allergies
            else {
                Text("You have not added any allergies yet.")
                    .opacity(0.6)
            }
            
            // Create allergy button
            NavigationLink(destination: AllergyCreateView(
                            viewModel: viewModel,
                            child: child)
                .onAppear {viewModel.resetInputFields()}) {
                Text("+ Add Allergy")
            }
                .buttonSizing(ButtonSizing.flexible)
                .controlSize(ControlSize.large)
                .buttonStyle(.glassProminent)
        }
        .padding(.horizontal, 12)
        .navigationTitle("\(child.name)'s Allergies")
        .navigationBarTitleDisplayMode(.large)
    }
}


#Preview {
    @StateObject @Previewable var viewModel: AppViewModel = AppViewModel()
    let child: Child = viewModel.alphabeticallyOrderedChildren.first!
    
    NavigationStack {
        AllergiesView(viewModel: viewModel,
                      child: child
        )
    }
}
