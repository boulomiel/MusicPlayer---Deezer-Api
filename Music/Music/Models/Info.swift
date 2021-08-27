// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let info = try? newJSONDecoder().decode(Info.self, from: jsonData)

import Foundation

// MARK: - Info
struct Info: Codable {
    var countryISO, country: String?
    var infoOpen: Bool?
    var pop, uploadToken: String?
    var uploadTokenLifetime: Int?
    var userToken: JSONNull?
    var hosts: Hosts?
    var ads: Ads?
    var hasPodcasts: Bool?
    var offers: [Offer]?

    enum CodingKeys: String, CodingKey {
        case countryISO = "country_iso"
        case country
        case infoOpen = "open"
        case pop
        case uploadToken = "upload_token"
        case uploadTokenLifetime = "upload_token_lifetime"
        case userToken = "user_token"
        case hosts, ads
        case hasPodcasts = "has_podcasts"
        case offers
    }
}
