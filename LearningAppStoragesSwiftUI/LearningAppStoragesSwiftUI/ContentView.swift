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
                
                VStack {
                    Button(action: {
                        showThemeSelection.toggle()
                    }, label: {
                        /// When using system images which are SF Symbols, instead of setting frames with width
                        /// and height, one should set size with typography modifier .font
                        /// This is because SF Symbols are technically typographical and one achieves best behaviour
                        /// and performance setting size like this.
                        Image(systemName: "paintbrush.pointed.fill")
                            .font(.system(size: 200))
                            .foregroundStyle(Theme.colorFor(value: appTheme))
                    })
                    
                    Button(action: {
                        showTeamSelection.toggle()
                    }, label: {
                        Image(choosenHero, bundle: nil)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                            .padding()
                            .border(Theme.colorFor(value: appTheme), width: 20)
                    })
                    
                }
                
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
