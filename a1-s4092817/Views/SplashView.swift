//
//  SplashView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 24/8/2026.
//

import SwiftUI

struct SplashView: View {
    @State private var showHomeView: Bool = false
    
    var body: some View {
        if showHomeView {
            ContentView()
        } else {
            NavigationStack {
                VStack {
                    // MARK: Custom Splash
                    CustomSplash {
                        // --- VERTICAL LINE ---
                        Rectangle()
                            .frame(width: 3, height: 150)
                        
                        // --- TEXT ---
                        Text("Kid")
                            .font(.system(size: 40))
                            .fontWeight(.semibold)
                            .fixedSize()
                        Text("Health")
                            .font(.system(size: 40))
                            .fontWeight(.semibold)
                            .fixedSize()
                        
                        // --- SF SYMBOLS ---
                        Image(systemName: "heart.text.clipboard")
                            .font(.system(size: 32, weight: .medium))
                        Image(systemName: "cross")
                            .font(.system(size: 12, weight: .bold))
                    }
                    .padding(10)
                    // MARK: Caption
                    Text("""
                         Your children's medical information,
                         all in one place.
                        """)
                    .font(.body)
                    .multilineTextAlignment(.center)
                }
                // MARK: Toolbar Button
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button {
                            withAnimation {                            showHomeView = true
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    SplashView()
}
