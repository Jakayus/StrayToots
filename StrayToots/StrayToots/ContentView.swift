//
//  ContentView.swift
//  StrayToots
//
//  Created by Joel Sereno on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var MastodonAPI = MastodonNetworking()
    
    var body: some View {
        VStack {
            Text("Go time!")
            Button("Refresh") {
                MastodonAPI.fetchTimelineData()
                print("test: \(MastodonAPI.toots.count)")
            }
            List {
                ForEach(MastodonAPI.toots) {
                    tempView(string1: $0.content, string2: "temp")
                }
            }
            
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(MastodonAPI: MastodonNetworking())
    }
}

        
// Temporary View that holds an individual toot
struct tempView: View {
    var string1 = ""
    var string2 = ""
    var body: some View {
        VStack{
            Text(string1)
            Text(string2)
            Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
        }
    }
}
