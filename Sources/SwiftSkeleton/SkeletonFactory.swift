//
//  SkeletonFactory.swift
//  Skeleton
//
//  Created by Abdallah Nehme on 22/10/2021.
//

import Foundation
import UIKit

import UIKit

/// A factory responsible for creating and applying skeleton layers to views.
/// This class centralizes the logic for how skeletons are constructed for different `UIView` subclasses.
@MainActor
public class SkeletonFactory {
    /// Creates and applies a skeleton layer to a given view.
    ///
    /// This function determines the appropriate skeleton type based on the view's class
    /// (e.g., multiline for `UILabel`) and applies it.
    ///
    /// - Parameters:
    ///   - view: The `UIView` to apply the skeleton onto.
    ///   - numberOfLines: The number of lines to render for multiline skeletons. Defaults to `1`.
    ///   - cornerRadius: The corner radius for the skeleton layers. Defaults to `5`.
    ///   - animation: A custom animation to use. If `nil`, a default is created.
    public func make(for view: UIView, numberOfLines: Int = 1, cornerRadius: CGFloat? = 5, animation: CABasicAnimation? = nil) {
        let basicAnimation = animation ?? SkeletonAnimation.animation(
            firstColor: SkeletonSettings.default.firstColor,
            secondColor: SkeletonSettings.default.secondColor
        )

        switch view {
        case is UILabel, is UITextView:
            self.multilineSkeleton(on: view, numberOfLines: numberOfLines, cornerRadius: cornerRadius, animation: basicAnimation)
        default:
            self.singleViewSkeleton(on: view, cornerRadius: cornerRadius, animation: basicAnimation)
        }
    }

    /// Creates a multiline skeleton, typically for `UILabel` or `UITextView`.
    private func multilineSkeleton(on view: UIView, numberOfLines: Int, cornerRadius: CGFloat?, animation: CABasicAnimation) {
        let stackView = ANStackView(style: .v(distribution: .fillEqually, spacing: 3)).view
        stackView.tag = 909090
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let edgeInsets = SkeletonConstraint.edgeInsets
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInsets.left),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -edgeInsets.right),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInsets.top),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -edgeInsets.bottom)
        ])

        for _ in 0..<max(1, numberOfLines) {
            let line = UIView()
            line.layer.cornerRadius = cornerRadius ?? SkeletonSettings.default.cornerRadius ?? 5
            line.layer.cornerCurve = .continuous
            line.layer.add(animation, forKey: "skeletonAnimationKey")
            stackView.addArrangedSubview(line)
        }
    }

    /// Creates a single-view skeleton overlay for generic `UIView` instances.
    private func singleViewSkeleton(on view: UIView, cornerRadius: CGFloat?, animation: CABasicAnimation) {
        let skeletonView = UIView()
        skeletonView.tag = 909090
        view.addSubview(skeletonView)
        skeletonView.translatesAutoresizingMaskIntoConstraints = false
        skeletonView.layer.cornerRadius = cornerRadius ?? view.layer.cornerRadius
        skeletonView.layer.cornerCurve = .continuous

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
