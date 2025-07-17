//
//  SkeletonConstraint.swift
//  Toters
//
//  Created by Abdallah Nehme on 22/10/2021.
//  Copyright © 2021 Toters. All rights reserved.
//

import UIKit

/// A class to manage global layout constraints for all skeleton views.
public class SkeletonConstraint {
    /// The edge insets to apply as padding around the skeleton relative to its container.
    ///
    /// For predictable behavior across the app, it is recommended to set this
    /// global property only once at app launch (e.g., in `AppDelegate`).
    nonisolated(unsafe) public static var edgeInsets: UIEdgeInsets = .zero
}
