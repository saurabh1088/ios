//
//  TeamsView.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 16/06/24.
//

import SwiftUI

struct TeamsView: View {
    // AppStorage
    @AppStorage("appTheme") var appTheme: String = Theme.red.rawValue
    
    // State properties
    @State private var showJusticeLeague = false
    @State private var showAvengers = false
    
    var body: some View {
        ZStack {
            Theme.colorFor(value: appTheme)
            
            VStack {
                Button {
                    showJusticeLeague.toggle()
                } label: {
                    Text("Justice League")
                }
                
                Button {
                    showAvengers.toggle()
                } label: {
                    Text("Avengers")
                }
                
            }
            .navigationDestination(isPresented: $showJusticeLeague) {
                JusticeLeagueView()
            }
            .navigationDestination(isPresented: $showAvengers) {
                AvengersView()
            }
        }
    }
}

#Preview {
    TeamsView()
}
