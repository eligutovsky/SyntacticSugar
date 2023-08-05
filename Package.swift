// swift-tools-version: 5.7

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
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "SyntacticSugarTests",
            dependencies: ["SyntacticSugar"],
            path: "Tests")
    ]
)
