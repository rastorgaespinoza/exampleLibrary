// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExampleLibrary",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "ExampleLibrary",
            targets: ["ExampleLibrary"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
          name: "ExampleLibrary",
          dependencies: [],
          resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ExampleLibraryTests",
            dependencies: ["ExampleLibrary"]
        ),
    ]
)
