//
//  SkeletonFactory.swift
//  Skeleton
//
//  Created by Abdallah Nehme on 22/10/2021.
//

import Foundation
import UIKit

@MainActor
public class SkeletonFactory {
    // The `make` method now matches the signature called by the UIView extension.
    public func make(for view: UIView, numberOfLines: Int = 1, cornerRadius: CGFloat? = 5, animation: CABasicAnimation? = nil ) {
        // The animation now uses the default settings for colors.
        let basicAnimation = animation ?? SkeletonAnimation.makeAnimation(
            firstColor: SkeletonSettings.default.firstColor,
            secondColor: SkeletonSettings.default.secondColor
        )

        if let label = view as? UILabel {
            self.labelSkeleton(label: label, numberOfLines: numberOfLines, cornerRadius: cornerRadius, basicAnimation)
        } else {
            self.viewSkeleton(view: view, cornerRadius: cornerRadius, basicAnimation)
        }
    }

    // This private method creates the skeleton for a UILabel.
    private func labelSkeleton(label: UILabel, numberOfLines: Int, cornerRadius: CGFloat? = 5,  _ animation: CABasicAnimation){
        let stackView = ANStackView(style: .v(distribution: .fillEqually, spacing: 3)).view
        label.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.tag = 909090 // Unique tag to find the skeleton view later.

        // Use the global edge insets.
        let edgeInsets = SkeletonConstraint.edgeInsets
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: edgeInsets.left),
            stackView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -edgeInsets.right),
            stackView.topAnchor.constraint(equalTo: label.topAnchor, constant: edgeInsets.top),
            stackView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: -edgeInsets.bottom)
        ])

        for _ in 0..<numberOfLines {
            let skeletonView = UIView()
            // Use the provided cornerRadius or the default from settings.
            skeletonView.layer.cornerRadius = cornerRadius ?? SkeletonSettings.default.cornerRadius ?? 5
            skeletonView.layer.cornerCurve = .continuous
            skeletonView.layer.add(animation, forKey: "skeletonAnimationKey")
            stackView.addArrangedSubview(skeletonView)
        }
    }

    // This private method creates the skeleton for a generic UIView.
    private func viewSkeleton(view: UIView, cornerRadius: CGFloat? = 5, _ animation: CABasicAnimation){
        let skeletonView = UIView()
        skeletonView.tag = 909090 // Unique tag to find the skeleton view later.
        view.addSubview(skeletonView)
        skeletonView.translatesAutoresizingMaskIntoConstraints = false

        // Use the provided cornerRadius or the default from settings.
        skeletonView.layer.cornerRadius = cornerRadius ?? SkeletonSettings.default.cornerRadius ?? 5
        skeletonView.layer.cornerCurve = .continuous

        // Use the global edge insets.
        let edgeInsets = SkeletonConstraint.edgeInsets
        NSLayoutConstraint.activate([
            skeletonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInsets.left),
            skeletonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -edgeInsets.right),
            skeletonView.topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInsets.top),
            skeletonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -edgeInsets.bottom)
        ])

        skeletonView.layer.add(animation, forKey: "skeletonAnimationKey")
    }
}
