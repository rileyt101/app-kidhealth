//
//  HomeView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 25/8/2026.
//

/**
Home.swift
Home View that displays the user's children.
*/

import SwiftUI

struct HomeView: View {
    //MARK: - View Model
    @StateObject var viewModel = AppViewModel()
    
    // MARK: - View Content
    var body: some View {
        NavigationStack {
            List(viewModel.alphabeticallyOrderedChildren) { child in
                NavigationLink(destination: AllergiesView(viewModel: viewModel, child: child)) {
                    Text(child.name)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Your Children")
            .navigationBarTitleDisplayMode(.large)

        }
    }
}

#Preview {
    HomeView()
}
