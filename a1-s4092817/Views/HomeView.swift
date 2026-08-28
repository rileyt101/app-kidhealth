//
//  HomeView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 25/8/2026.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.alphabeticallyOrderedChildren) { child in
                NavigationLink(destination: AllergiesView(child: child)) {
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
