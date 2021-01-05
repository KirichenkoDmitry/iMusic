//
//  NetworkService.swift
//  iMusic
//
//  Created by Дмитрий Кириченко on 11.12.2020.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, complition: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term": "\(searchText)",
                          "limit": "100",
                          "media": "music"
        ]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponce) in
            if let error = dataResponce.error {
                print("Error recieved requestion data: \(error.localizedDescription)")
                complition(nil)
                return
            }
            
            guard let data = dataResponce.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects: ", objects)
                complition(objects)
                
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                complition(nil)
            }
        }
    }
}
