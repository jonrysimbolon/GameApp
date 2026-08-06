// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Detail",
    platforms: [
        .iOS(.v26),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Detail",
            targets: ["Detail"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jonrysimbolon/GameAppIosDomain.git", from: "1.1.0"),
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "Detail",
            dependencies: [
                .product(name: "Domain", package: "GameAppIosDomain"),
                "Shared"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
