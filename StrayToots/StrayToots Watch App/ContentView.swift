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
            RefreshView(MastodonAPI: MastodonAPI).tag(Tabs.refreshTab)
            TootsTimelineView(MastodonAPI: MastodonAPI).tag(Tabs.tootsTab)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(MastodonAPI: MastodonNetworking())
    }
}

// SUPPORTING VIEWS
// TODO: Create a better file structure for these views

struct RefreshView: View {
    @ObservedObject var MastodonAPI: MastodonNetworking
    
    var body: some View {
        Button("🐘 REFRESH") {
            MastodonAPI.fetchTimelineData()
            print("debug: toots count: \(MastodonAPI.toots.count)")
        }
    }
}


struct TootsTimelineView: View {
    @ObservedObject var MastodonAPI: MastodonNetworking
    
    var body: some View {
        ScrollView {
            ForEach(MastodonAPI.toots) {
                TootView(toot: $0.content)
            }
        }
    }
}


struct TootView: View {
    var toot = ""
    
    var BackgroundColors = [Color.red, Color.blue, Color.yellow, Color.green] // SmashBros 4 player tribute
    
    var body: some View {
        VStack{
            HStack {
                Label("Toot Start", systemImage: "person.crop.circle.dashed")
                Image(systemName: "quote.opening")
            }
            Text(toot.stripOutHtml() ?? "Error")
            Label("Toot End", systemImage: "quote.closing")
            Divider()
        }
        .background(BackgroundColors.randomElement())
    }
}


