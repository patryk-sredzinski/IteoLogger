// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IteoLogger",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "IteoLogger",
            targets: ["IteoLogger"]),
    ],
    targets: [
        .target(
            name: "IteoLogger",
            dependencies: [],
            path: "IteoLogger",
            exclude: [
                "Info.plist",
                "../Preview/",
                "../IteoLoggerExample/",
                "../IteoLoggerTests/",
                "../IteoLogger.podspec"
            ]),
    ]
)
