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

import UIKit

/// A helper class to create skeleton animations.
public class SkeletonAnimation {
    /// Creates a standard pulsing gradient animation.
    /// - Parameters:
    ///   - duration: The duration of one pulse of the animation. Defaults to `1` second.
    ///   - firstColor: The starting color of the gradient.
    ///   - secondColor: The ending color of the gradient.
    /// - Returns: A `CABasicAnimation` configured for a skeleton effect.
    public class func animation(duration: CFTimeInterval = 1, firstColor: UIColor = .gray, secondColor: UIColor = .white) -> CABasicAnimation {
        let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        pulseAnimation.fromValue = firstColor.cgColor
        pulseAnimation.toValue = secondColor.cgColor
        pulseAnimation.duration = duration
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        pulseAnimation.isRemovedOnCompletion = false
        return pulseAnimation
    }
}
