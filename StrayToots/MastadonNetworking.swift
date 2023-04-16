//
//  MastadonNetworking.swift
//  StrayToots
//
//  Created by Joel Sereno on 4/15/23.
//

import Foundation


/// Toot Definitions
/// Determine the information from each Toot that will be visible to the user, so that it can be decoded

struct Toot: Identifiable, Codable {
    let id: String
    let content: String
    let Account: Account
    
}

struct Account: Codable {
    let username: String
}

class MastadonNetworking: ObservableObject {
    
    @Published var toots = [Toot]() // toots will be held here
    
    init() {
        print("init")
    }
    
    func fetchTimelineData() {
        
        let access_token = getAccessToken()
        print("access token: \(access_token)")
        
        // create a URL
        guard let url = URL(string: "https://iosdev.space/api/v1/timelines/home?limit=10") else { return } // exit function if not working
        
        // convert to a URL Request (a URL Request object encapsulates policies as well as url)
        var urlRequest = URLRequest(url: url)
        
        // add HTTP header that is required for OAuth for specific user
        urlRequest.setValue("Bearer \(access_token)", forHTTPHeaderField: "Authorization")
        
        // start a URL session
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in  // data, response, error
            if let data = data,
               let toots = try? JSONDecoder().decode([Toot].self, from: data) {   // attempt to decode from [Toot]
                self.toots = toots
                print("success!")
            } else {
                print("errored out")
            }
        }
        
        task.resume()
        
        
        
    } // end fetch
    
    
    
}
