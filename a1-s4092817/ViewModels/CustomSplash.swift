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
    /// How much the icon overlaps the top-right corner of the titleFirst
    var iconOverlap: CGFloat = 10

    // Expected subview order: [divider, titleText, icon, subtitleText]
    private enum Index {
        static let divider = 0
        static let titleFirst = 1
        static let titleLast = 2
        static let icon = 3
        static let subtitle = 4
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        guard subviews.count == 5 else { return .zero }

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
            width: proposal.width ?? totalWidth,
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
        let icon = subviews[Index.icon]
        let subtitle = subviews[Index.subtitle]

        let titleSize = titleFirst.sizeThatFits(.unspecified)
        let dividerSize = divider.sizeThatFits(ProposedViewSize(width: nil, height: titleSize.height))
        let iconSize = icon.sizeThatFits(.unspecified)
        let subtitleSize = subtitle.sizeThatFits(
            ProposedViewSize(width: bounds.width, height: nil)
        )

        let logoBlockWidth = dividerSize.width + dividerSpacing + titleSize.width
        let logoBlockHeight = max(titleSize.height, dividerSize.height)

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
        let titleOrigin = CGPoint(
            x: dividerOrigin.x + dividerSize.width + dividerSpacing,
            y: originY + (logoBlockHeight - titleSize.height) / 2
        )
        titleFirst.place(
            at: titleOrigin,
            proposal: ProposedViewSize(width: titleSize.width, height: titleSize.height)
        )

        // Place icon, badged onto the top-right corner of the titleFirst
        let iconOrigin = CGPoint(
            x: titleOrigin.x + titleSize.width - iconOverlap,
            y: titleOrigin.y - iconSize.height / 2
        )
        icon.place(
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
        KidHealthLayout {
            // 0: divider
            Rectangle()
                .fill(Color.black)
                .frame(width: 3, height: 150)

            // 1: titleFirst (two lines, matching "Kid" / "Health")
            Text("Kid")
                .font(.system(size: 40))
                .multilineTextAlignment(.leading)
                .lineSpacing(2)
                .fixedSize()
            
            Text("Health")
                .font(.system(size: 40))
                .multilineTextAlignment(.leading)
                .lineSpacing(2)
                .fixedSize()

            // 2: clipboard + cross icon
            ZStack {
                Image(systemName: "list.clipboard")
                    .font(.system(size: 26, weight: .medium))
                Image(systemName: "plus")
                    .font(.system(size: 12, weight: .bold))
                    .offset(x: 14, y: -14)
            }
            .fixedSize()

            // 3: subtitle
            Text("Your children's medical information,\nall in one place.")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.7))
                .fixedSize()
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    CustomSplashView()
}

