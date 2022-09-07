// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Ottu",
    products: [.library(name: "Ottu",targets: ["Ottu"])],
    dependencies: [],
    targets: [.binaryTarget(name: "Ottu",path: "Source/Ottu.xcframework")]
)
