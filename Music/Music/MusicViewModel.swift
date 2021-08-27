//
//  SearchTextObserved.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import Foundation
import SwiftUI
import Combine


class MusicViewModel: ObservableObject {
    
    @Published var text : String = ""
    @Published var search : Search?
    @Published var tracks : Tracks?
    @Published var previewUrl : URL?
    
    var subsriptions  = Set<AnyCancellable>()

    
    func searchData(query : String){
        API.search(query: query)
            .sink(receiveCompletion: {print("MusicViewModel" , $0)}) { search in
                self.search = search
            }
            .store(in: &subsriptions)

    }
    
    
    func getTracks(url : String){
        API.requestData(url: .track(url), type: Tracks.self)
            .sink(receiveCompletion: {print("MusicViewModel", $0)}) { result in
                self.tracks = result
            }
            .store(in: &subsriptions)
    }
    
    
    func getDuration(value : Double, style: DateComponentsFormatter.UnitsStyle = .positional) -> String {
        
      let formatter = DateComponentsFormatter()
      formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
      formatter.unitsStyle = style
      return formatter.string(from: value) ?? ""
    }
    
    
    func downloadPreview(url : String){
        API.downloadPreview(url: url){url in
            DispatchQueue.main.async {
                self.previewUrl = url
            }
        }
    }
}
