//
//  RedactionView.swift
//  LogRedactor
//
//  Created by Saurabh Verma on 12/02/26.
//

import SwiftUI
import PhotosUI

struct RedactionView: View {
    @StateObject private var viewModel = RedactionViewModel()
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        VStack {
            if let image = viewModel.originalImage {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()

                    ForEach(viewModel.redactionBlocks) { block in
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: block.rect.width,
                                   height: block.rect.height)
                            .position(x: block.rect.midX,
                                      y: block.rect.midY)
                    }
                }
            }

            PhotosPicker("Select Screenshot",
                         selection: $selectedItem,
                         matching: .images)

        }
        .onChange(of: selectedItem) { newItem in
            Task {
                await viewModel.loadImage(from: newItem)
            }
        }
        .padding()
    }
}

#Preview {
    RedactionView()
}
