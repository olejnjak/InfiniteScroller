// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "InfiniteScroller",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "InfiniteScroller", targets: ["InfiniteScroller"]),
    ],
    targets: [
        .target(name: "InfiniteScroller", path: "InfiniteScroller")
    ]
)