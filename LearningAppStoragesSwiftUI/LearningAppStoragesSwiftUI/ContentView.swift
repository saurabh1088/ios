//
//  ContentView.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 15/06/24.
//

import SwiftUI

struct ContentView: View {
    // AppStorage
    @AppStorage("appTheme") var appTheme: String = Theme.red.rawValue
    
    // SceneStorage
    @SceneStorage("choosenHero") var choosenHero: String = "icon_person"
    
    // State properties
    @State private var showThemeSelection = false
    @State private var showTeamSelection = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "folder.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .foregroundStyle(.tint)
                    .tint(Theme.colorFor(value: appTheme))
                
                HStack {
                    Button(action: {
                        showThemeSelection.toggle()
                    }, label: {
                        Text("Theme")
                            .foregroundStyle(Theme.colorFor(value: appTheme))
                    })
                    
                    Button(action: {
                        showTeamSelection.toggle()
                    }, label: {
                        Text("Hero")
                            .foregroundStyle(Theme.colorFor(value: appTheme))
                    })
                    
                }
                
                Image(choosenHero, bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .tint(Theme.colorFor(value: appTheme))
            }
            .padding()
            .navigationDestination(isPresented: $showThemeSelection) {
                AppThemeSelectionView()
            }
            .navigationDestination(isPresented: $showTeamSelection) {
                TeamsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
