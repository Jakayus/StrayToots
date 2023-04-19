//
//  ContentView.swift
//  StrayToots Watch App
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
            ScrollView {
                ForEach(MastodonAPI.toots) {
                    tempView(string1: $0.content, string2: "temp")
                    //Text("\($0.id)")
                    //Text("\($0.content)")
                    
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
