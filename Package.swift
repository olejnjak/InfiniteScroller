// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "InfiniteScroller",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "InfiniteScroller", targets: ["InfiniteScroller"]),
    ],
    targets: [
        .target(name: "InfiniteScroller")
    ]
)
