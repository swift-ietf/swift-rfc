// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-rfc",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "IETF RFC", targets: ["IETF RFC"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-ietf/swift-ietf.git", branch: "main")
    ],
    targets: [
        .target(
            name: "IETF RFC",
            dependencies: [
                .product(name: "IETF", package: "swift-ietf")
            ]
        ),
        .testTarget(
            name: "IETF RFC Tests",
            dependencies: [.target(name: "IETF RFC")]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableUpcomingFeature("InferIsolatedConformances"),
            .enableExperimentalFeature("Lifetimes"),
            .treatAllWarnings(as: .error),
        ]
}
