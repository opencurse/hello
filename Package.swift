import PackageDescription

let package = Package(
    name: "HelloAPI",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.80.0")
    ],
    targets: [
        .executableTarget(
            name: "Run",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ],
            path: "Sources/Run"
        )
    ]
)
