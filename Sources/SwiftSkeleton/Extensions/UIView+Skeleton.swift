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

/// An extension on `UIView` providing easy access to skeleton functionality.
extension UIView {
    private static let skeletonViewTag = 909090

    /// Toggles the skeleton animation on or off.
    ///
    /// When set to `true`, a default skeleton is applied. When set to `false`, any existing skeleton is removed.
    /// This operation is safely dispatched to the main thread.
    public var isSkeleton: Bool {
        get {
            return viewWithTag(Self.skeletonViewTag) != nil
        }
        set {
            DispatchQueue.main.async {
                if newValue {
                    self.removeSkeleton()
                    let cornerRadius = (self.layer.cornerRadius > 0) ? self.layer.cornerRadius : 5
                    SkeletonFactory().make(for: self, cornerRadius: cornerRadius)
                } else {
                    self.removeSkeleton()
                }
            }
        }
    }

    /// Shows a skeleton on the view with detailed customization options.
    ///
    /// This is the main function for applying a customized skeleton. The entire operation is safely
    /// dispatched to the main thread to prevent UI-related concurrency issues.
    ///
    /// - Parameters:
    ///   - numberOfLines: The number of lines to render. This is primarily for `UILabel` and `UITextView`. Defaults to `1`.
    ///   - cornerRadius: The corner radius of the skeleton layers. If `nil`, it uses the view's existing corner radius. Defaults to `5`.
    ///   - animation: A custom `CABasicAnimation` to use. If `nil`, a default pulsing animation is used.
    public func skeletonWith(numberOfLines: Int = 1, cornerRadius: CGFloat? = 5, animation: CABasicAnimation? = nil) {
        DispatchQueue.main.async {
            self.removeSkeleton()
            SkeletonFactory().make(
                for: self,
                numberOfLines: numberOfLines,
                cornerRadius: cornerRadius,
                animation: animation
            )
        }
    }

    /// Removes any existing skeleton view from this view.
    /// This method is idempotent and safe to call even if no skeleton is present.
    public func removeSkeleton() {
        if let view = self.viewWithTag(Self.skeletonViewTag) {
            view.layer.removeAllAnimations()
            view.removeFromSuperview()
        }
    }
}
