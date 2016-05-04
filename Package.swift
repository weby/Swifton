import PackageDescription

let package = Package(
    name: "Swifton",
    dependencies: [
        .Package(url: "https://github.com/weby/Stencil.git", versions: Version(0,5,4)..<Version(1,0,0)),
        .Package(url: "https://github.com/Zewo/String.git", majorVersion: 0, minor: 5),
        .Package(url: "https://github.com/open-swift/S4.git", majorVersion: 0, minor: 4),
        .Package(url: "https://github.com/Zewo/Router.git", versions: Version(0,5,0)..<Version(1,0,0))
    ]
)
