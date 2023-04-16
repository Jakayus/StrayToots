//
//  ContentView.swift
//  StrayToots
//
//  Created by Joel Sereno on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var MastadonAPI = MastadonNetworking()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("token: \(getAccessToken())")
        }
        .onAppear{
            MastadonAPI.fetchTimelineData()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(MastadonAPI: MastadonNetworking())
    }
}
