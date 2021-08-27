//
//  User.swift
//  Music
//
//  Created by Ruben Mimoun on 01/08/2021.
//

import Foundation

// MARK: - User
struct User: Codable {
    var id, name: String?
    var link, picture: String?
    var pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    var country: String?
    var tracklist: String?
    var type: String?

    enum CodingKeys: String, CodingKey {
        case id, name, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case country, tracklist, type
    }
}
