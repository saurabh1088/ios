//
//  SecondaryLevelOneOnOneView.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 26/07/24.
//

import SwiftUI

struct SecondaryLevelOneOnOneView: View {
    @EnvironmentObject var navigationModel: NavigationModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Secondary Level One-On-One View")
            popToRootViewButton
            saveNavigationPath
        }
    }
    
    @ViewBuilder private var popToRootViewButton: some View {
        Button {
            navigationModel.navigationPath.removeLast(navigationModel.navigationPath.count)
        } label: {
            Text("Pop to root")
        }
    }
    
    @ViewBuilder private var saveNavigationPath: some View {
        Button {
            navigationModel.savePath()
        } label: {
            Text("Save path history")
        }

    }
}

#Preview("Secondary level one-on-one") {
    SecondaryLevelOneOnOneView()
}
