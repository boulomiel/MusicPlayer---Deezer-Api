// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tracksDatum = try? newJSONDecoder().decode(TracksDatum.self, from: jsonData)

import Foundation

// MARK: - TracksDatum

//{"id":472899522,"readable":true,"title":"Pas besoin","title_short":"Pas besoin","title_version":"","isrc":"FR7O51800100","link":"https:\/\/www.deezer.com\/track\/472899522","duration":176,"track_position":1,"disk_number":1,"rank":492031,"explicit_lyrics":true,"explicit_content_lyrics":1,"explicit_content_cover":2,"preview":"https:\/\/cdns-preview-a.dzcdn.net\/stream\/c-a7ac31ee532d011b2640a2f99fdbc119-5.mp3","md5_image":"5c4650e9550bf102026bcacfc67f6dac","artist":{"id":1479842,"name":"PLK","tracklist":"https:\/\/api.deezer.com\/artist\/1479842\/top?limit=50","type":"artist"},"type":"track"}

struct TracksDatum: Codable {
    var id: Int?
    var readable: Bool?
    var title, titleShort, titleVersion: String?
    var link: String?
    var duration, rank: Int?
    var explicitLyrics: Bool?
    var explicitContentLyrics, explicitContentCover: Int?
    var preview: String?
    var md5Image: String?
    var artist: TrackArtist?
    var type: String?
    
    
    struct TrackArtist: Codable {
        var id: Int?
        var name: String?
        var tracklist: String?
        var type: String?
    }


    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case artist, type
    }
}
