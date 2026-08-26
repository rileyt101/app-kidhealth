//
//  HomeView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 25/8/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List(children) { child in
                NavigationLink(destination: AllergiesView(child: child)) {
                    Text(child.name)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.large)

        }
    }
}

#Preview {
    HomeView()
}
