//
//  AppThemeSelectionView.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 15/06/24.
//

import SwiftUI

struct AppThemeSelectionView: View {
    // AppStorage
    @AppStorage("appTheme") var appTheme: String = Theme.red.rawValue
    
    var body: some View {
        ZStack {
            
            Theme.colorFor(value: appTheme)
            
            VStack {
                ForEach(Theme.allCases, id: \.rawValue) { color in
                    Button {
                        appTheme = color.rawValue
                    } label: {
                        Text(color.rawValue)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    AppThemeSelectionView()
}
