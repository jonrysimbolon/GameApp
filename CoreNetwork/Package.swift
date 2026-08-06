// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "CoreNetwork",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "CoreNetwork",
            targets: ["CoreNetwork"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            from: "5.12.0"
        )
    ],
    targets: [
        .target(
            name: "CoreNetwork",
            dependencies: [
                .product(
                    name: "Alamofire",
                    package: "Alamofire"
                )
            ]
        ),
        .testTarget(
            name: "CoreNetworkTests",
            dependencies: [
                "CoreNetwork"
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
