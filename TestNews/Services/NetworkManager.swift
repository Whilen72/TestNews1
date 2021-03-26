//
//  NetworkManager.swift
//  TestNews
//
//  Created by macOS on 26.03.2021.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache <NSString, NSData>()
    
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrlString = "https://newsapi.org/v2/"
    private let USTopHeadlines = "top-headlines?country=us"
    
    func getNews(completion: @escaping([News]?) -> Void){
        let urlString = "\(baseUrlString)\(USTopHeadlines)&apikey=\(APIKey.apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.articles)
            
           } .resume()  //== wut? why dont work?==
     )}
}


