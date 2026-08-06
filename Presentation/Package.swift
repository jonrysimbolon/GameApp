// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [
        .iOS(.v26),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        )
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                "Domain",
                "Shared"
            ]
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]
        )
    ],
    swiftLanguageModes: [.v6]
)
