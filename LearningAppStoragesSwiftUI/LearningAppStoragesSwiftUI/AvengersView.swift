//
//  AvengersView.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 16/06/24.
//

import SwiftUI

struct AvengersView: View {
    @AppStorage("appTheme") var appTheme: String = Theme.red.rawValue
    
    // SceneStorage
    @SceneStorage("choosenHero") var choosenHero: String = "icon_person"
    
    var body: some View {
        ZStack {
            Theme.colorFor(value: appTheme)
            
            VStack(alignment: .leading) {
                ForEach(Avenger.allCases, id: \.rawValue) { hero in
                    HStack {
                        Image(hero.icon, bundle: nil)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text(hero.rawValue)
                    }
                    .onTapGesture {
                        choosenHero = hero.icon
                    }
                }
            }
        }
    }
}

#Preview {
    AvengersView()
}
