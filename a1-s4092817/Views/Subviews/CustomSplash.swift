//
//  CustomSplash.swift
//  a1-s4092817
//
//  Created by Riley Tran on 23/8/2026.
//

/**
CustomSplash.swift
Subview using Layout protocol to display splash logo of app.
*/

import SwiftUI

struct CustomSplash: Layout {
    // MARK: - Fixed spacing values
    // Spacing between the divider and the first Title
    let dividerSpacing: CGFloat = 16
    // Spacing between the First and Last word in title
    let titleVerticalSpacing: CGFloat = 15
    // Additional spacing between the first Title and the prominent Symbol
    let prominentSymbolHorizontalSpacing: CGFloat = 8
    // Reverse horizontal offset of superscript Symbol (how close Symbols are to each other)
    let symbolHorizontalOffset: CGFloat = -5

    // MARK: - Fixed layout parameter order
    // Enum represents expected order of custom layout parameters
    private enum Index {
        static let divider = 0
        static let titleFirst = 1
        static let titleLast = 2
        static let symbolProminent = 3
        static let symbolSuperscript = 4
    }
    
    // MARK: - Functions
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        guard subviews.count == 5 else { return .zero }
        
        // Get sizes
        let titleFirstSize = subviews[Index.titleFirst].sizeThatFits(.unspecified)
        let titleLastSize = subviews[Index.titleLast].sizeThatFits(.unspecified)
        let dividerSize = subviews[Index.divider].sizeThatFits(.unspecified)

        // Width spans from the divider (left), to the very end of the last Title (right)
        let logoBlockWidth = dividerSize.width +
                            dividerSpacing +
                            titleFirstSize.width / 2 +
                            titleLastSize.width
        
        // Height spans the divider height (assumes that divider is longer than text elements)
        let logoBlockHeight = dividerSize.height

        let totalWidth = logoBlockWidth
        let totalHeight = logoBlockHeight

        return CGSize(
            width: totalWidth,
            height: totalHeight
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        // Ensure 5 inputs
        guard subviews.count == 5 else { return }
        
        // Get sizes
        let divider = subviews[Index.divider]
        let titleFirst = subviews[Index.titleFirst]
        let titleLast = subviews[Index.titleLast]
        let symbolProminent = subviews[Index.symbolProminent]
        let symbolSuperscript = subviews[Index.symbolSuperscript]

        let titleFirstSize = titleFirst.sizeThatFits(.unspecified)
        let titleLastSize = titleLast.sizeThatFits(.unspecified)
        
        let dividerSize = divider.sizeThatFits(ProposedViewSize(width: nil, height: titleFirstSize.height))
        let symbolProminentSize = symbolProminent.sizeThatFits(.unspecified)
        let symbolSuperscriptSize = symbolSuperscript.sizeThatFits(.unspecified)

        let logoBlockHeight = dividerSize.height

        // Get origin co-ords of X and Y
        let originX = bounds.minX
        let originY = bounds.minY

        // Place divider (vertical line) on very left of Layout
        let dividerOrigin = CGPoint(
            x: originX,
            y: originY
                + (logoBlockHeight - dividerSize.height) / 2
        )
        divider.place(
            at: dividerOrigin,
            proposal: ProposedViewSize(width: dividerSize.width, height: dividerSize.height)
        )

        // Place titleFirst, right of divider
        let titleFirstOrigin = CGPoint(
            x: dividerOrigin.x
                + dividerSize.width
                + dividerSpacing,
            y: originY
                - titleVerticalSpacing / 2
                + (logoBlockHeight - titleFirstSize.height) / 2
        )
        titleFirst.place(
            at: titleFirstOrigin,
            proposal: ProposedViewSize(width: titleFirstSize.width, height: titleFirstSize.height)
        )
        
        // Place last Title underneath first Title, beginning halfway of first Title's width
        let titleLastOrigin = CGPoint(
            x: dividerOrigin.x
                + dividerSize.width
                + dividerSpacing
                + (titleFirstSize.width / 2),
            y: originY
                + (logoBlockHeight) / 2
                + titleVerticalSpacing / 2
        )
        titleLast.place(
            at: titleLastOrigin,
            proposal: ProposedViewSize(width: titleLastSize.width, height: titleLastSize.height)
        )

        // Place symbolProminent beside first Title
        let symbolProminentOrigin = CGPoint(
            x: titleFirstOrigin.x
            + titleFirstSize.width
            + prominentSymbolHorizontalSpacing,
            y: titleFirstOrigin.y
        )
        symbolProminent.place(
            at: symbolProminentOrigin,
            proposal: ProposedViewSize(width: symbolProminentSize.width, height: symbolProminentSize.height)
        )
        
        // Place superscript Symbol on top-right on prominent Symbol
        let symbolSuperscriptOrigin = CGPoint(
            x: symbolProminentOrigin.x
                + symbolProminentSize.width
                + symbolHorizontalOffset,
            y: symbolProminentOrigin.y
        )
        symbolSuperscript.place(
            at: symbolSuperscriptOrigin,
            proposal: ProposedViewSize(width: symbolSuperscriptSize.width, height: symbolSuperscriptSize.height)
        )
    }
}

// MARK: - Preview
#Preview {
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
    .border(Color.red, width: 1)
}

