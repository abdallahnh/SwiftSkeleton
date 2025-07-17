# SwiftSkeleton

[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange.svg)]()
[![Platform](https://img.shields.io/badge/platform-iOS%2015%2B-lightgrey.svg)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)]()

SwiftSkeleton is a simple, lightweight, and customizable library to add skeleton loading animations to any `UIView`.

***

### ✨ Features

* **Easy to use**: Show a skeleton with a single line: `myView.isSkeleton = true`.
* **Customizable**: Easily change colors, corner radius, and provide your own `CABasicAnimation`.
* **Multiline Support**: Automatically creates multiple skeleton lines for `UILabel` and `UITextView`.
* **Safe & Modern**: Built with `@MainActor` to ensure all UI updates are performed safely on the main thread.

***

### 📦 Installation

You can add SwiftSkeleton to your project using Swift Package Manager.

1.  In Xcode, open your project and navigate to **File > Add Packages...**
2.  Enter the repository URL: `https://github.com/abdallahnh/SwiftSkeleton.git` (replace with your actual URL).
3.  Select the `SwiftSkeleton` product and add it to your app target.

***

### 🚀 How to Use

#### Quick Start

To show or hide the default skeleton animation, simply set the `isSkeleton` property on any `UIView`.

```swift
import SwiftSkeleton

// Show skeleton
myImageView.isSkeleton = true
myLabel.isSkeleton = true

// Hide skeleton
myImageView.isSkeleton = false
Advanced Customization
```
For more control, use the skeletonWith() method, which allows you to customize the appearance for a specific view.

```swift
// Show a 3-line skeleton on a UILabel
descriptionLabel.skeletonWith(numberOfLines: 3)

// Apply a skeleton with a custom corner radius and animation
myView.skeletonWith(cornerRadius: 12, animation: customAnimation)
```
Global Settings

You can change the default colors and edge padding for all skeleton views by updating the SkeletonSettings.default and SkeletonConstraint.edgeInsets objects, typically in your AppDelegate.

```swift
// In AppDelegate.swift
import SwiftSkeleton

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Set new default colors
    SkeletonSettings.default.firstColor = UIColor.systemGray4
    SkeletonSettings.default.secondColor = UIColor.systemGray6
    
    // Set default edge padding for all skeletons
    SkeletonConstraint.edgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
    
    return true
}
```
