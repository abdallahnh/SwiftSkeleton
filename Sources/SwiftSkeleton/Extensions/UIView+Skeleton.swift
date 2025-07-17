//
//  UIView+Skeleton.swift
//  Skeleton
//
//  Created by Abdallah Nehme on 21/10/2021.
//
/*
 * -Description: UIView extension to add skeleton functionality
 * -Author: Abdallah Nehme
 */
import UIKit

extension UIView {
    private static let skeletonViewTag = 909090

    /// Toggles the skeleton animation on or off.
    /// This operation is safely dispatched to the main thread.
    public var isSkeleton: Bool {
        get {
            return viewWithTag(Self.skeletonViewTag) != nil
        }
        set {
            DispatchQueue.main.async {
                if newValue {
                    self.removeSkeleton()
                    let cornerRadius = (self.layer.cornerRadius != 0) ? self.layer.cornerRadius : 5
                    SkeletonFactory().make(for: self, cornerRadius: cornerRadius)
                } else {
                    self.removeSkeleton()
                }
            }
        }
    }

    /// Use to create a custom skeleton animation with a given number of lines.
    /// This operation is safely dispatched to the main thread.
    /// - Parameters:
    ///   - numberOfSkeletonLines: Specifies the number of lines in the view.
    ///   - cornerRadius: Overrides the view's default corner radius.
    ///   - animation: A custom animation to use for the skeleton.
    public func skeletonWith(
        numberOfSkeletonLines: Int = 1,
        cornerRadius: CGFloat? = 5,
        animation: CABasicAnimation? = nil
    ) {
        DispatchQueue.main.async {
            self.removeSkeleton()
            SkeletonFactory().make(
                for: self,
                numberOfLines: numberOfSkeletonLines,
                cornerRadius: cornerRadius,
                animation: animation
            )
        }
    }

    /// Removes the skeleton view and stops layer animations.
    /// Must be called on the main thread, which the other methods handle.
    public func removeSkeleton() {
        if let view = self.viewWithTag(Self.skeletonViewTag) {
            view.layer.removeAllAnimations()
            view.removeFromSuperview()
        }
    }
}
