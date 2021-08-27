// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let albumArtist = try? newJSONDecoder().decode(AlbumArtist.self, from: jsonData)

import Foundation

// MARK: - AlbumArtist
struct AlbumArtist: Codable {
    var id: String?
    var name: String?
    var picture: String?
    var pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    var tracklist: String?
    var type: ArtistType?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}
