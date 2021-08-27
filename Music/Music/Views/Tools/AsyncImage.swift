//
//  AsyncImage.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import Foundation
import Combine
import SwiftUI

class AsyncImage : ObservableObject {
    
    enum AsyncImageStatus : LocalizedError{
        case emptyUrl , failure(String), success
    }
    
    @Published var image : Image =  Image(systemName: "camera.circle")
    var subscriptions = Set<AnyCancellable>()
    
    func loadImage(url : String){
        guard let mUrl =  URL(string: url) else {return}
        URLSession.shared.dataTaskPublisher(for: mUrl)
            .receive(on: DispatchQueue.main)
            .mapError { error in
                AsyncImageStatus.failure(error.localizedDescription)
            }
            .map{data , _ -> Image in
                if let  image = UIImage(data: data){
                    return Image(uiImage: image)
                }else{
                    return Image(systemName: "xmark.octagon")
                }
            }
            .sink(receiveCompletion: {completion in
                if case .failure(let error) =  completion{
                    print(error.localizedDescription)
                }
                
            }) { image in
                self.image =  image
            }
            .store(in: &subscriptions)
        
        }
            
}

