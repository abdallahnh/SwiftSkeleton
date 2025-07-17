// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftSkeleton",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .macCatalyst(.v15) 
    ],
    products: [
        .library(
            name: "SwiftSkeleton",
            targets: ["SwiftSkeleton"]),
    ],
    targets: [
        .target(
            name: "SwiftSkeleton"),
        .testTarget(
            name: "SwiftSkeletonTests",
            dependencies: ["SwiftSkeleton"]
        ),
    ]
)
