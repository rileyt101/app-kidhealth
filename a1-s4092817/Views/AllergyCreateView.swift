//
//  AllergyCreateView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 27/8/2026.
//

import SwiftUI

struct AllergyCreateView: View {
    
    @ObservedObject var viewModel: AppViewModel
    var body: some View {
        Text("AllergyCreateView")
    }
}

#Preview {
    @StateObject @Previewable var viewModel: AppViewModel = AppViewModel()
    let child: Child = viewModel.getChildren().first!
    
    AllergyCreateView(viewModel: viewModel)
}

