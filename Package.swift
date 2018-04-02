// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "linuxmain-generator",
    products: [
      .executable(name: "linuxmain-generator", targets: ["linuxmain-generator"])
    ],
    dependencies: [
        .package(url: "https://github.com/kareman/Moderator", .upToNextMajor(from: "0.4.3")),
        .package(url: "https://github.com/kareman/FileSmith", .upToNextMajor(from: "0.1.6"))
    ],
    targets: [
        .target(name: "linuxmain-generator", dependencies: ["Moderator", "FileSmith"])
    ]
)
