// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Copyright 2021 Esri.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
    name: "arcgis-maps-sdk-swift-toolkit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15)
    ],
    products: [
        .library(
            name: "ArcGISToolkit",
            targets: ["ArcGISToolkit"]
        ),
    ],
    
    // Local package as downloaded from https://runtime-zip.esri.com/userContent/runtime/swift/sdk_swift/200.1.0/
    // That Package.swift was edited to reference the scframework folder instead of the zip
    // The ArcGISToolkit is now added to the EFArcGISv200Proto project as a framework
    dependencies: [
        .package(name: "arcgis-maps-sdk-swift", path: "../SwiftDaily")
        ],
    targets: [
        .target(
            name: "ArcGISToolkit",
            dependencies: [
                .product(name: "ArcGIS", package: "arcgis-maps-sdk-swift")
            ]
        ),
        .testTarget(
            name: "ArcGISToolkitTests",
            dependencies: ["ArcGISToolkit"]
        )
    ]
    
//    dependencies: [
//            .package(url: "https://github.com/Esri/arcgis-maps-sdk-swift", .upToNextMinor(from: "200.0.0-beta"))
//        ],
//    targets: [
//        .target(
//            name: "ArcGISToolkit",
//            dependencies: [
//                .product(name: "ArcGIS", package: "arcgis-maps-sdk-swift")
//            ]
//        ),
//        .testTarget(
//            name: "ArcGISToolkitTests",
//            dependencies: ["ArcGISToolkit"]
//        )
//    ]
    
//    dependencies: [
//        .package(url: "https://devtopia.esri.com/runtime/swift-daily", exact: "200.1.0-3778")
//    ],
//    targets: [
//        .target(
//            name: "ArcGISToolkit",
//            dependencies: [
//                .product(name: "ArcGIS", package: "swift-daily")
//            ]
//        ),
//        .testTarget(
//            name: "ArcGISToolkitTests",
//            dependencies: ["ArcGISToolkit"]
//        )
//    ]
)
