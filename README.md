# SwiftSkeleton

[![Swift Version](https://img.shields.io/badge/Swift-5.7-orange.svg)]()
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)]()

SwiftSkeleton is a simple, lightweight, and customizable library to add skeleton loading animations to any `UIView`.

***

### ✨ Features

* **Easy to use**: Show a skeleton with a single line: `myView.isSkeleton = true`.
* **Customizable**: Easily change colors, corner radius, and even provide your own `CABasicAnimation`.
* **Multiline Support**: Automatically creates multiple skeleton lines for `UILabel`.
* **Safe & Modern**: Built with modern Swift concurrency to ensure all UI updates are performed safely on the main thread.
* **Lightweight**: No external dependencies.

***

### 📦 Installation

You can add SwiftSkeleton to your project using Swift Package Manager.

1.  In Xcode, open your project and navigate to **File > Add Packages...**
2.  Enter the repository URL: `https://github.com/your-username/SwiftSkeleton.git` (replace with your actual URL).
3.  Select the `SwiftSkeleton` product and add it to your app target.

***

### 🚀 How to Use

#### Quick Start

To show or hide the default skeleton animation, simply set the `isSkeleton` property on any `UIView`.

```swift
import SwiftSkeleton
import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
    }

    func startLoading() {
        // Show skeleton
        avatarImageView.isSkeleton = true
        nameLabel.isSkeleton = true

        // After 2 seconds, hide it and show content
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stopLoading()
        }
    }

    func stopLoading() {
        // Hide skeleton
        avatarImageView.isSkeleton = false
        nameLabel.isSkeleton = false

        // Load actual content
        avatarImageView.image = UIImage(systemName: "person.crop.circle.fill")
        nameLabel.text = "Abdallah Nehme"
    }
}
Advanced Customization

For more control, use the skeletonWith() method, which allows you to customize the appearance and behavior for a specific view.

Multiline Skeletons for Labels

For labels, you can specify the number of skeleton lines to display. This is perfect for simulating multiline text.

Swift
// Show a 3-line skeleton on a UILabel
descriptionLabel.skeletonWith(numberOfSkeletonLines: 3)
Custom Corner Radius & Animation

You can provide a custom cornerRadius and your own CABasicAnimation.

Swift
// Create a slower, custom-colored animation
let customAnimation = SkeletonAnimation.animation(
    duration: 3.0,
    firstColor: .systemPurple,
    secondColor: .systemIndigo
)

// Apply the skeleton with a custom corner radius and animation
myView.skeletonWith(cornerRadius: 12, animation: customAnimation)
Global Settings

You can change the default colors for all skeleton views by updating the SkeletonSettings.default object, typically in your AppDelegate.

Swift
// In AppDelegate.swift

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Set new default colors for the skeleton animation
    SkeletonSettings.default.firstColor = UIColor.systemTeal
    SkeletonSettings.default.secondColor = UIColor.systemBlue
    
    return true
}
📜 License

This project is licensed under the MIT License.
