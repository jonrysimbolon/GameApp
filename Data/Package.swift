// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS(.v26),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]
        )
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../CoreNetwork")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                "Domain",
                "CoreNetwork"
            ],
            resources: [
                .process("Local/CoreData/GameApp.xcdatamodeld")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
