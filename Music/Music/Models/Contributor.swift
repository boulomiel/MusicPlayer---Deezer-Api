// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let contributor = try? newJSONDecoder().decode(Contributor.self, from: jsonData)

import Foundation

// MARK: - Contributor
struct Contributor: Codable {
    var id: Int?
    var name: String?
    var link, share, picture: String?
    var pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    var radio: Bool?
    var tracklist: String?
    var type: ArtistType?
    var role: String?

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type, role
    }
}
