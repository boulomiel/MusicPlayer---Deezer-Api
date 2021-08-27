//
//  Constants.swift
//  Music
//
//  Created by Ruben Mimoun on 01/08/2021.
//

import Foundation

enum URLTypes{
    
    case artist, album , chart, editorial, genre, track(String), radio, podcast, playlist, info , search
    
    
    static var baseURL  = "https://api.deezer.com/"
    
    var url : String {
        switch self {
        case .track(let url):
            return url
        default :
           return URLTypes.baseURL
        }
    }


}
