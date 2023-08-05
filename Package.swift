// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "SyntacticSugar",
    products: [
        .library(
            name: "SyntacticSugar",
            targets: ["SyntacticSugar"])
    ],
    targets: [
        .target(
            name: "SyntacticSugar",
            dependencies: []),
        .testTarget(
            name: "SyntacticSugarTests",
            dependencies: ["SyntacticSugar"])
    ]
)
