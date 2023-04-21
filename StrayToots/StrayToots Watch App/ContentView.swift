//
//  ContentView.swift
//  StrayToots Watch App
//
//  Created by Joel Sereno on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var MastodonAPI:  MastodonNetworking
    
    @State var currentTab: Tabs = .tootsTab
    
    enum Tabs {
        case refreshTab, tootsTab
    }
    
    var body: some View {
        TabView {
            RefreshView().tag(Tabs.refreshTab)
            TootsView().tag(Tabs.tootsTab)
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


// SUPPORTING VIEWS
// TODO: Create a better file structure for these views

struct RefreshView: View {
    var body: some View {
        Text("Refresh View")
//        Button("Refresh") {
//            MastodonAPI.fetchTimelineData()
//            print("test: \(MastodonAPI.toots.count)")
//        }
    }
}


struct TootsView: View {
    var body: some View {
        
        Text("Toots View")
//        ScrollView {
//            ForEach(MastodonAPI.toots) {
//                tempView(string1: $0.content, string2: "temp")
//
//            }
//        }
    }
}
 
 
 
