// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bigNativeAdsHome = try? newJSONDecoder().decode(BigNativeAdsHome.self, from: jsonData)

import Foundation

// MARK: - BigNativeAdsHome
struct BigNativeAdsHome: Codable {
    var iphone, ipad, android, androidTablet: Android?

    enum CodingKeys: String, CodingKey {
        case iphone, ipad, android
        case androidTablet = "android_tablet"
    }
}
