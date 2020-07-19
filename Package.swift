// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AKAbbreviatedNumberFormatted",
  products: [
    .library(
      name: "AKAbbreviatedNumberFormatted",
      targets: ["AKAbbreviatedNumberFormatted"]
    ),
  ],
  targets: [
    .target(
      name: "AKAbbreviatedNumberFormatted",
      dependencies: []
    ),
  ]
)
