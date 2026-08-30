//
//  SplashView.swift
//  a1-s4092817
//
//  Created by Riley Tran on 24/8/2026.
//

/**
SplashView.swift
Splash screen; the first screen that the user sees when opening the app.
*/

import SwiftUI

struct SplashView: View {
    var body: some View {
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
                // --- CAPTION ---
                Text("""
                     Your children's allergy information,
                     all in one place.
                    """)
                .font(.body)
                .multilineTextAlignment(.center)
            }
            // MARK: Toolbar Button
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink(destination: HomeView()) {
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
