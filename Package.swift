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
    dependencies: [],
    targets: [
        .target(
            name: "IteoLogger",
            dependencies: [],
            resources: [
                .process("Scenes/Logs/LogsController.xib"),
                .process("Scenes/Logs/Views/LogCell.xib"),
                .process("Scenes/Logs/Views/PauseCell.xib"),
                .process("Scenes/Logs/Views/LogSectionHeader.xib"),
                .process("Scenes/Filters/Views/FilterCell.xib"),
                .process("Scenes/Filters/Views/FilterSectionHeader.xib"),
                .process("Scenes/Filters/FiltersController.xib")
            ]),
    ]
)
