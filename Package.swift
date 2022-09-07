import PackageDescription

let package = Package(
    name: "Ottu",
    products: [.library(name: "Ottu",targets: ["Ottu"])],
    dependencies: [],
    targets: [.binaryTarget(name: "Ottu",path: "Source/Ottu.xcframework")]
)
