// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let default = try? newJSONDecoder().decode(Default.self, from: jsonData)

import Foundation

// MARK: - Default
struct Default: Codable {
    var start, interval: Int?
    var unit: String?
}
