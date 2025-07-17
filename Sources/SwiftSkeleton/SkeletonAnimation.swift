//
//  SkeletonAnimation.swift
//  Skeleton
//
//  Created by Abdallah Nehme on 22/10/2021.
//

/* SkeletonAnimation - SkeletonAnimation.swift
 Created by Abdallah Nehme on 22/10/2021.

 All rights reserved. */

/* The SkeletonAnimation class is  used to provide the core skeletion animation
 * with varaition of animation and options.
 */

import Foundation
import UIKit

public class SkeletonAnimation {
    /// Creates a customizable gradient animation.
    /// - Parameters:
    ///   - duration: The duration of one pulse of the animation. Defaults to 1 second.
    ///   - firstColor: The starting color of the gradient.
    ///   - secondColor: The ending color of the gradient.
    /// - Returns: A `CABasicAnimation` configured for a skeleton effect.
    public static func makeAnimation(
        duration: CFTimeInterval = 1,
        firstColor: UIColor,
        secondColor: UIColor
    ) -> CABasicAnimation {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        pulseAnimation.fromValue = firstColor.cgColor
        pulseAnimation.toValue = secondColor.cgColor

        pulseAnimation.duration = duration
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        // Set to false to prevent removal on app backgrounding
        pulseAnimation.isRemovedOnCompletion = false
        return pulseAnimation
    }
}
