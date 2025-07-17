//
//  SkeletonSettings.swift
//  Skeleton
//
//  Created by Abdallah Nehme on 22/10/2021.
//

import UIKit

/// A class to configure the default appearance of all skeleton views.
public class SkeletonSettings {
    /// The primary color of the skeleton gradient.
    public var firstColor: UIColor
    /// The secondary color of the skeleton gradient.
    public var secondColor: UIColor
    /// The default corner radius for skeleton layers.
    public var cornerRadius: CGFloat?
    /// The default animation style.
    public var animation: CABasicAnimation

    /// A shared singleton instance for global configuration.
    /// It is recommended to configure this once at app launch for consistent appearance.
    nonisolated(unsafe) public static let `default`: SkeletonSettings = SkeletonSettings(firstColor: .lightGray, secondColor: .gray, animation: CABasicAnimation())

    /// Creates a new settings configuration.
    /// - Parameters:
    ///   - firstColor: The primary color of the skeleton gradient.
    ///   - secondColor: The secondary color of the skeleton gradient.
    ///   - cornerRadius: The default corner radius for skeleton layers.
    ///   - animation: The default animation style.
    public init(firstColor: UIColor, secondColor: UIColor, cornerRadius: CGFloat? = 5, animation: CABasicAnimation) {
        self.firstColor = firstColor
        self.secondColor = secondColor
        self.cornerRadius = cornerRadius
        self.animation = animation
    }
}
