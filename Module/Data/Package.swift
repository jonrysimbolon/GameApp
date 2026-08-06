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
        .package(url: "https://github.com/jonrysimbolon/GameAppIosDomain.git", from: "1.1.0"),
        .package(path: "../CoreNetwork")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                .product(name: "Domain", package: "GameAppIosDomain"),
                "CoreNetwork"
            ],
            resources: [
                .process("Local/CoreData/GameApp.xcdatamodeld")
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
