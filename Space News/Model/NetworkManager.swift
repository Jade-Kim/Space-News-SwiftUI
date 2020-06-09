//
//  NetworkManager.swift
//  Space News
//
//  Created by Jade Kim on 5/12/20.
//  Copyright © 2020 Jade Kim. All rights reserved.
//

import Foundation

public class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://spaceflightnewsapi.net/api/v1/articles") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.docs
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                    
                }
                
            }
            
            task.resume()
        }
    }    
}
