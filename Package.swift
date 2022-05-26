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
    .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "3.0.0"),
  ],
  targets: [
    .target(
      name: "ExampleLibrary",
      dependencies: ["Lottie"],
      resources: [
        .process("Resources/Colors.xcassets"),
        .copy("Resources/LottieFiles")
      ]
    ),
    .testTarget(
      name: "ExampleLibraryTests",
      dependencies: ["ExampleLibrary"]
    ),
  ]
)
