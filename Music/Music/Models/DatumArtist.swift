// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datumArtist = try? newJSONDecoder().decode(DatumArtist.self, from: jsonData)

import Foundation

// MARK: - DatumArtist
struct DatumArtist: Codable {
    var id: String?
    var name: String?
    var tracklist: String?
    var type: ArtistType?
}
