//
//  ContentView.swift
//  LearningAppiPadSwiftUI
//
//  Created by Saurabh Verma on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var colorOpted = Color.clear
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationSplitView {
                List(ColorOption.allCases) { color in
                    Button(color.printValue) {
                        colorOpted = color.value
                    }
                }
            } detail: {
                ZStack {
                    colorOpted
                        .ignoresSafeArea()
                }
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
