// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v26),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
    ],
    targets: [
        .target(
            name: "Domain"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
