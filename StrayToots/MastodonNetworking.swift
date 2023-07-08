//
//  MastadonNetworking.swift
//  StrayToots
//
//  Created by Joel Sereno on 4/15/23.
//

import Foundation
import SwiftUI


/// Toot Definitions
/// Determine the information from each Toot that will be visible to the user, so that it can be decoded

struct Toot: Identifiable, Codable {
    let id: String
    var content: String
}

/// class to manage Mastadon API
class MastodonNetworking: ObservableObject {
    
    @Published var toots = [Toot]() // toots will be held here
    
    var mastodonInstance: String = "mastodon.example"
    
    init() {
        print("init") // debug
    }

    func fetchTimelineData() {
        
        // grab token from config file
        let token = getAccessToken()
        
        // verify URL exists, else return
        guard let url = URL(string: "https://\(mastodonInstance)/api/v1/timelines/home?limit=10") else { return }
        // crete URL request
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        
        // add HTTP Authorization
        request.addValue("Bearer \(token) ", forHTTPHeaderField: "Authorization")
        
        // adjust HTTP type to GET
        request.httpMethod = "GET"
        
        // create URLSession
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // verify data itself is good
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            // attempt to decode the toots from data
            if let toots = try? JSONDecoder().decode([Toot].self, from: data)
            {
                // set toots on main thread
                DispatchQueue.main.async {
                    self.toots = toots
                }
                print("successful decoding!")
            } else {
                print("unsuccessful decoding")
            }
        }
        task.resume()
    }
    
}
