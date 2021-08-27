// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ads = try? newJSONDecoder().decode(Ads.self, from: jsonData)

import Foundation

// MARK: - Ads
struct Ads: Codable {
    var audio: Audio?
    var display: Display?
    var bigNativeAdsHome: BigNativeAdsHome?

    enum CodingKeys: String, CodingKey {
        case audio, display
        case bigNativeAdsHome = "big_native_ads_home"
    }
}
