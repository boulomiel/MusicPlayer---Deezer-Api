//
//  API.swift
//  Music
//
//  Created by Ruben Mimoun on 01/08/2021.
//

import Foundation
import Combine



class API {

    enum APIError : LocalizedError {
        case http, network
        
        var failureReason: String{
            switch self{
            case .http:
                return "Bad response Requesr"
            case .network:
                return "Network problem, check your connections"
            }
        }
    }
    
   static  func requestData<T : Codable>( url : URLTypes, type : T.Type ,query : String? = nil) -> AnyPublisher<T, Error>{
        let request = URLRequest(url: query == nil ? URL(string: url.url)! : URL(string: "\(url.url)/search/?q=\(query!)")!)
       return URLSession.shared.dataTaskPublisher(for: request )
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
    static  func downloadPreview( url : String, completion : @escaping((URL)->())){
        URLSession.shared.downloadTask(with: URL(string: "http://freetone.org/ring/stan/iPhone_5-Alarm.mp3")!) { url, response, error in
            guard
                let cache = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first,
                let url = url
            else {
                return
            }

            do {
                let file = cache.appendingPathComponent("\(UUID().uuidString).mp3")
                try FileManager.default.moveItem(atPath: url.path,
                                                 toPath: file.path)
                    completion(file)
            }
            catch {
                print(error.localizedDescription)
            }
         
        }
    }
    
    
   static func search(query : String) ->  AnyPublisher<Search, Error>{
    let subject = API.requestData(url: .search, type: Search.self ,query: query)
    let thottled = subject.throttle(for: .seconds(0.4), scheduler: DispatchQueue.main, latest: true)
        .share().eraseToAnyPublisher()
        return thottled
    }
    
    
}
