//
//  CustomSplash.swift
//  a1-s4092817
//
//  Created by Riley Tran on 23/8/2026.
//

import SwiftUI
// TODO: - Recomment code
// TODO: - Refine placements
// MARK: - Custom Layout

struct CustomSplash: Layout {
    /// Spacing between the divider and the titleFirst block
    var dividerSpacing: CGFloat = 16
    /// Spacing between the titleFirst block and the subtitle
    var verticalSpacing: CGFloat = 24
    /// How much the symbolProminent overlaps the top-right corner of the titleFirst
    var iconOverlap: CGFloat = 10
    /// Spacing between the First and Last word in title
    var titleVerticalSpacing: CGFloat = 10

    // Enum represents expected order of custom layout parameters
    private enum Index {
        static let divider = 0
        static let titleFirst = 1
        static let titleLast = 2
        static let symbolProminent = 3
        static let symbolSuperscript = 4
        static let subtitle = 5
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        guard subviews.count == 6 else { return .zero }

        let titleFirstSize = subviews[Index.titleFirst].sizeThatFits(.unspecified)
        let titleLastSize = subviews[Index.titleLast].sizeThatFits(.unspecified)
        let dividerWidth = subviews[Index.divider].sizeThatFits(.unspecified).width
        let subtitleSize = subviews[Index.subtitle].sizeThatFits(
            ProposedViewSize(width: proposal.width, height: nil)
        )

        // "Logo block" = divider + spacing + titleFirst
        let logoBlockWidth = dividerWidth +
                            dividerSpacing +
                            titleFirstSize.width / 2 +
                            titleLastSize.width
        
        let logoBlockHeight = max(titleFirstSize.height, subviews[Index.divider].sizeThatFits(.unspecified).height)

        let totalWidth = max(logoBlockWidth, subtitleSize.width)
        let totalHeight = logoBlockHeight + verticalSpacing + subtitleSize.height

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
        guard subviews.count == 6 else { return }

        let divider = subviews[Index.divider]
        let titleFirst = subviews[Index.titleFirst]
        let titleLast = subviews[Index.titleLast]
        let symbolProminent = subviews[Index.symbolProminent]
        let subtitle = subviews[Index.subtitle]

        let titleFirstSize = titleFirst.sizeThatFits(.unspecified)
        let dividerSize = divider.sizeThatFits(ProposedViewSize(width: nil, height: titleFirstSize.height))
        let iconSize = symbolProminent.sizeThatFits(.unspecified)
        let subtitleSize = subtitle.sizeThatFits(
            ProposedViewSize(width: bounds.width, height: nil)
        )

        let logoBlockWidth = dividerSize.width + dividerSpacing + titleFirstSize.width
        let logoBlockHeight = max(titleFirstSize.height, dividerSize.height)

        // Horizontally center the whole composition within the proposed bounds
        let contentWidth = max(logoBlockWidth, subtitleSize.width)
        let originX = bounds.minX + (bounds.width - contentWidth) / 2
        let originY = bounds.minY

        // Place divider (leading edge of top block)
        let dividerOrigin = CGPoint(
            x: originX,
            y: originY + (logoBlockHeight - dividerSize.height) / 2
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
            y: originY + (logoBlockHeight) / 2
                + titleVerticalSpacing / 2
        )
        titleLast.place(
            at: titleLastOrigin,
            proposal: ProposedViewSize(width: titleFirstSize.width, height: titleFirstSize.height)
        )

        // Place symbolProminent, badged onto the top-right corner of the titleFirst
        let iconOrigin = CGPoint(
            x: titleFirstOrigin.x + titleFirstSize.width - iconOverlap,
            y: titleFirstOrigin.y - iconSize.height / 2
        )
        symbolProminent.place(
            at: iconOrigin,
            proposal: ProposedViewSize(width: iconSize.width, height: iconSize.height)
        )

        // Place subtitle, centered below the top block
        let subtitleOrigin = CGPoint(
            x: originX + (contentWidth - subtitleSize.width) / 2,
            y: originY + logoBlockHeight + verticalSpacing
        )
        subtitle.place(
            at: subtitleOrigin,
            proposal: ProposedViewSize(width: subtitleSize.width, height: subtitleSize.height)
        )
    }
}

// MARK: - Demo usage

struct CustomSplashView: View {
    var body: some View {
        CustomSplash {
            /// --- VERTICAL LINE ---
            Rectangle()
                .fill(Color.black)
                .frame(width: 3, height: 150)

            /// --- TEXT ---
            Text("Kid")
                .font(.system(size: 40))
                .fontWeight(.semibold)
                .fixedSize()
            Text("Health")
                .font(.system(size: 40))
                .fontWeight(.semibold)
                .fixedSize()

            /// --- SF SYMBOLS ---
                Image(systemName: "list.clipboard")
                    .font(.system(size: 26, weight: .medium))
                Image(systemName: "plus")
                    .font(.system(size: 12, weight: .bold))
                    .offset(x: 14, y: -14)

            /// --- CAPTION ---
            Text("Your children's medical information,\nall in one place.")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .fixedSize()
        }
        .padding(.horizontal, 40)
        .border(Color.red, width: 1)
    }
}

#Preview {
    CustomSplashView()
}

