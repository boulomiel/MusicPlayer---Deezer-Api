// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let album = try? newJSONDecoder().decode(Album.self, from: jsonData)

import Foundation

// MARK: - Album
struct Album: Codable {
    var id, title, upc: String?
    var link, share, cover: String?
    var coverSmall, coverMedium, coverBig, coverXl: String?
    var md5Image: Md5Image?
    var genreID: Int?
    var genres: Genres?
    var label: String?
    var nbTracks, duration, fans, rating: Int?
    var releaseDate, recordType: String?
    var available: Bool?
    var tracklist: String?
    var explicitLyrics: Bool?
    var explicitContentLyrics, explicitContentCover: Int?
    var contributors: [Contributor]?
    var artist: AlbumArtist?
    var type: String?
    var tracks: Tracks?

    enum CodingKeys: String, CodingKey {
        case id, title, upc, link, share, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case genreID = "genre_id"
        case genres, label
        case nbTracks = "nb_tracks"
        case duration, fans, rating
        case releaseDate = "release_date"
        case recordType = "record_type"
        case available, tracklist
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case contributors, artist, type, tracks
    }
}
