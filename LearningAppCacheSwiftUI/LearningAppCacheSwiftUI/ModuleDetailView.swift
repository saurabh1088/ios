//
//  ModuleDetailView.swift
//  LearningAppCacheSwiftUI
//
//  Created by Saurabh Verma on 18/11/26.
//

import SwiftUI

struct ModuleDetailView: View {

    let module: LearningModule

    var body: some View {
        VStack(spacing: 20) {

            Image(systemName: module.systemImage)
                .font(.system(size: 55))
                .foregroundStyle(.blue)

            Text(module.title)
                .font(.title.bold())

            Text(module.subtitle)
                .foregroundStyle(.secondary)

            Text("Learning content coming soon.")
                .font(.callout)
                .padding(.top, 20)

            Spacer()
        }
        .padding()
        .navigationTitle(module.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ModuleDetailView(module: LearningModule.all.first!)
}
