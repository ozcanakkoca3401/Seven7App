// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let rootPath = "../../"
private let corePackagePath = "\(rootPath)CorePackages/"

let package = Package(
    name: "HomeFeature",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HomeFeature",
            targets: ["HomeFeature"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        // MARK: - Core Packages
        .package(
            name: "CoreNetwork",
            path: "\(corePackagePath)CoreNetwork"
        ),
        .package(
            name: "CoreResource",
            path: "\(corePackagePath)CoreResource"
        ),
        .package(
            name: "CoreExtension",
            path: "\(corePackagePath)CoreExtension"
        ),

        // MARK: - Remote Packages
        .package(url: "https://github.com/SnapKit/SnapKit.git",
                 from: "5.0.1"),
        .package(url: "https://github.com/onevcat/Kingfisher.git",
            from: "7.8.1"),
        .package(url: "https://github.com/SVProgressHUD/SVProgressHUD.git",
                 from: "2.3.1"),

    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HomeFeature",
            dependencies: [
                "CoreNetwork",
                "CoreResource",
                "CoreExtension",
                "SnapKit",
                "Kingfisher",
                "SVProgressHUD",
            ]),
        .testTarget(
                name: "HomeFeatureTests",
                dependencies: ["HomeFeature"]),

    ]
)

