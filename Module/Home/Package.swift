// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Home",
    platforms: [
        .iOS(.v26),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jonrysimbolon/GameAppIosDomain.git", from: "1.1.0"),
        .package(path: "../Shared"),
        .package(path: "../Detail")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                .product(name: "Domain", package: "GameAppIosDomain"),
                "Shared",
                "Detail"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
