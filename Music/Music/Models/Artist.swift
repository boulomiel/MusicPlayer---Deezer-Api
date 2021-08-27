//
//  Artist.swift
//  Music
//
//  Created by Ruben Mimoun on 01/08/2021.
//


import Foundation

// MARK: - Artist
struct Artist: Codable {
    var id: Int?
    var name: String?
    var link, picture: String?
    var pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    var tracklist: String?
    var type: ArtistType?

    enum CodingKeys: String, CodingKey {
        case id, name, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case tracklist, type
    }
}
