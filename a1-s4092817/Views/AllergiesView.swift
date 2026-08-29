//
//  AllergiesView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergiesView: View {
    @ObservedObject var viewModel: AppViewModel
    
    var child: Child
    var viewTitle: String {
        child.name + "'s Allergies"
    }

    var body: some View {
            VStack {
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
                // Empty state
                else {
                    Text("You have not added any allergies yet.")
                        .opacity(0.6)
                }
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
            .navigationTitle(viewTitle)
            .navigationBarTitleDisplayMode(.large)
        }
}


#Preview {
    @StateObject @Previewable var viewModel: AppViewModel = AppViewModel()
    let child: Child = viewModel.getChildren().first!
    
    AllergiesView(viewModel: viewModel,
                  child: child
                    )
}
