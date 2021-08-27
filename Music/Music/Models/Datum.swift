//
//  Datum.swift
//  Music
//
//  Created by Ruben Mimoun on 01/08/2021.
//

struct Datum: Codable, Identifiable{
    var id: Int?
    var readable: Bool?
    var title, titleShort: String?
    var titleVersion: String?
    var link: String?
    var duration, rank: Int?
    var explicitLyrics: Bool?
    var explicitContentLyrics, explicitContentCover: Int?
    var preview: String?
    var md5Image: String?
    var artist: Artist?
    var album: DatumAlbum?
    var type: String?

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
        case artist, album, type
    }
}

struct DatumAlbum : Codable{
    
      var id : Int?
      var title: String?
      var cover: String?
      var coverSmall, coverMedium, coverBig, coverXl: String?
      var md5Image: String?
      var tracklist: String?
      var type: AlbumType?

      enum CodingKeys: String, CodingKey {
          case id, title, cover
          case coverSmall = "cover_small"
          case coverMedium = "cover_medium"
          case coverBig = "cover_big"
          case coverXl = "cover_xl"
          case md5Image = "md5_image"
          case tracklist, type
      }
}

enum AlbumType: String, Codable {
    case album = "album"
}

