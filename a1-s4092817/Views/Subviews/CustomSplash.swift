//
//  CustomSplash.swift
//  a1-s4092817
//
//  Created by Riley Tran on 23/8/2026.
//

import SwiftUI
// TODO: - Recomment code
// MARK: - Custom Layout

struct CustomSplash: Layout {
    /// Spacing between the divider and the titleFirst block
    var dividerSpacing: CGFloat = 16
    /// Spacing between the titleFirst block and the subtitle
    var verticalSpacing: CGFloat = 16
    /// Horizontal offset of divider (relative to the subtitle)
    var dividerHorizontalOffset: CGFloat = 32
    /// How much the symbolProminent overlaps the top-right corner of the titleFirst
    var iconOverlap: CGFloat = 10
    /// Spacing between the First and Last word in title
    var titleVerticalSpacing: CGFloat = 15

    // Enum represents expected order of custom layout parameters
    private enum Index {
        static let divider = 0
        static let titleFirst = 1
        static let titleLast = 2
        static let symbolProminent = 3
        static let symbolSuperscript = 4
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        guard subviews.count == 5 else { return .zero }
        
        let titleFirstSize = subviews[Index.titleFirst].sizeThatFits(.unspecified)
        let titleLastSize = subviews[Index.titleLast].sizeThatFits(.unspecified)
        let dividerSize = subviews[Index.divider].sizeThatFits(.unspecified)

        // "Logo block" = divider + spacing + titleFirst
        let logoBlockWidth = dividerSize.width +
                            dividerSpacing +
                            titleFirstSize.width / 2 +
                            titleLastSize.width
        
        let logoBlockHeight = max(titleFirstSize.height, dividerSize.height)

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
        guard subviews.count == 5 else { return }

        let divider = subviews[Index.divider]
        let titleFirst = subviews[Index.titleFirst]
        let titleLast = subviews[Index.titleLast]
        let symbolProminent = subviews[Index.symbolProminent]
        let symbolSuperscript = subviews[Index.symbolSuperscript]

        let titleFirstSize = titleFirst.sizeThatFits(.unspecified)
        let titleLastSize =
            titleLast.sizeThatFits(.unspecified)
        
        let dividerSize = divider.sizeThatFits(ProposedViewSize(width: nil, height: titleFirstSize.height))
        let symbolProminentSize = symbolProminent.sizeThatFits(.unspecified)
        let symbolSuperscriptSize =
            symbolSuperscript.sizeThatFits(.unspecified)

        let logoBlockHeight = max(titleFirstSize.height, dividerSize.height)

        // Get origin co-ords of X and Y
        let originX = bounds.minX
        let originY = bounds.minY

        // Place divider (vertical line)
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

        // Place symbolProminent, badged onto the top-right corner of the titleFirst
        let symbolProminentOrigin = CGPoint(
            x: titleFirstOrigin.x
            + 4 * titleLastSize.width / 7,
            y: titleFirstOrigin.y
        )
        
        symbolProminent.place(
            at: symbolProminentOrigin,
            proposal: ProposedViewSize(width: symbolProminentSize.width, height: symbolProminentSize.height)
        )
        
        let symbolSuperscriptOrigin = CGPoint(
            x: symbolProminentOrigin.x
                + symbolProminentSize.width,
            y: symbolProminentOrigin.y
        )
        
        symbolSuperscript.place(
            at: symbolSuperscriptOrigin,
            proposal: ProposedViewSize(width: symbolSuperscriptSize.width, height: symbolSuperscriptSize.height)
        )

        // Place subtitle, centered below the top block
    }
}

// MARK: - Demo usage

struct CustomSplashView: View {
    var body: some View {
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
}

#Preview {
    CustomSplashView()
}

