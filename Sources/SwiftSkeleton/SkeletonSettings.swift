//
//  SkeletonSettings.swift
//  Skeleton
//
//  Created by Abdallah Nehme on 22/10/2021.
//

import UIKit

// Change from 'class' to 'struct'
public struct SkeletonSettings {
    /// Skeleton first color.
    public let firstColor: UIColor
    /// Skeleton second color.
    public let secondColor: UIColor
    /// The corner radius for the animation. Defaults to 5.
    public let cornerRadius: CGFloat? // Fixed typo: cornorRaduis -> cornerRadius

    /// The default settings for the skeleton animation.
    @MainActor public static let `default` = SkeletonSettings()

    public init(
        firstColor: UIColor = .lightGray,
        secondColor: UIColor = .gray,
        cornerRadius: CGFloat? = 5
    ) {
        self.firstColor = firstColor
        self.secondColor = secondColor
        self.cornerRadius = cornerRadius
    }
}
