//
//  Search.swift
//  Music
//
//  Created by Ruben Mimoun on 01/08/2021.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    var data: [Datum]?
    var total: Int?
    var next: String?
    var prev : String?
}
