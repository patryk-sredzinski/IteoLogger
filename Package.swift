// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IteoLogger",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "IteoLogger",
            targets: ["IteoLogger"]),
    ],
    targets: [
        .target(
            name: "IteoLogger",
            dependencies: [],
            path: "IteoLogger"),
        .testTarget(
            name: "IteoLoggerTests",
            dependencies: ["IteoLogger"],
            path: "IteoLoggerTests"),
    ]
)
