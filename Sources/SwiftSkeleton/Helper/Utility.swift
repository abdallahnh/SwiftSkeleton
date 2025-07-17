//
//  Utility.swift
//  SwiftSkeleton
//
//  Created by Abdallah Nehme on 17/07/2025.
//
import UIKit
import Foundation

@MainActor
final class Utility {
    // This helper function contains the shared logic for creating a multiline skeleton.
    public static func createMultilineSkeleton(on view: UIView, numberOfLines: Int, cornerRadius: CGFloat?, animation: CABasicAnimation) {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 3
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
}
