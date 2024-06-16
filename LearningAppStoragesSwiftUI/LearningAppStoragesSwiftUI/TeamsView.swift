//
//  TeamsView.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 16/06/24.
//

import SwiftUI

struct TeamsView: View {
    @AppStorage("appTheme") var appTheme: String = Theme.red.rawValue
    
    var body: some View {
        ZStack {
            Theme.colorFor(value: appTheme)
            
            VStack {
                Text("Justice League")
                Text("Avengers")
            }
        }
    }
}

#Preview {
    TeamsView()
}
