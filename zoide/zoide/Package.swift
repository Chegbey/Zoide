import PackageDescription

let package = Package(
    name: "zoide",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/stephencelis/SQLite.swift.git", majorVersion: 0, minor: 11)
    ]
)
