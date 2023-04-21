//
//  StrayTootsApp.swift
//  StrayToots Watch App
//
//  Created by Joel Sereno on 4/15/23.
//

import SwiftUI

@main
struct StrayToots_Watch_AppApp: App {
    
    @StateObject var MastodonAPI = MastodonNetworking()
    
    var body: some Scene {
        WindowGroup {
            ContentView(MastodonAPI: MastodonAPI)
        }
    }
}
