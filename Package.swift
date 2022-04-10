// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Bordon",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Bordon",
            targets: ["Bordon"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Bordon",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v5]
)
