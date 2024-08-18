//
//  ContentView.swift
//  LearningAppiPadSwiftUI
//
//  Created by Saurabh Verma on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            NavigationSplitView {
                Text("Sidebar")
            } detail: {
                Text("Detail View")
            }
            .tabItem({
                Label("Option 1", systemImage: "1.circle")
            })
            .tag(0)
            
            NavigationSplitView {
                Text("Sidebar")
            } content: {
                Text("Content")
            } detail: {
                Text("Detail View")
            }
            .tabItem({
                Label("Option 2", systemImage: "2.circle")
            })
            .tag(1)
        }
    }
}

#Preview {
    ContentView()
}
