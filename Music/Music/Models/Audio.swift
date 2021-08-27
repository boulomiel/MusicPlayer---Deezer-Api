// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let audio = try? newJSONDecoder().decode(Audio.self, from: jsonData)

import Foundation

// MARK: - Audio
struct Audio: Codable {
    var audioDefault: Default?

    enum CodingKeys: String, CodingKey {
        case audioDefault = "default"
    }
}
