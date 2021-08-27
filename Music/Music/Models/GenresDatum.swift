// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genresDatum = try? newJSONDecoder().decode(GenresDatum.self, from: jsonData)

import Foundation

// MARK: - GenresDatum
struct GenresDatum: Codable {
    var id: Int?
    var name: String?
    var picture: String?
    var type: String?
}
