//
//  RedactionView.swift
//  LogRedactor
//
//  Created by Saurabh Verma on 12/02/26.
//

import SwiftUI
import PhotosUI

struct RedactionViewOld: View {
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
        .task(id: selectedItem) {
            await viewModel.loadImage(from: selectedItem)
        }
        .padding()
    }
}

struct RedactionView: View {
    @StateObject private var viewModel = RedactionViewModel()
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        VStack {
            if let image = viewModel.originalImage {
                // 1. Use an overlay so the coordinate space matches the Image exactly
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        GeometryReader { geo in
                            ZStack(alignment: .topLeading) {
                                ForEach(viewModel.redactionBlocks) { block in
                                    // TODO: Needs Documentation why this was required.
                                    // 2. Scale the rect from Image Pixels to View Points
                                    let scaledRect = scale(block.rect,
                                                           from: image.size,
                                                           to: geo.size)
                                    
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(width: scaledRect.width,
                                               height: scaledRect.height)
                                        .offset(x: scaledRect.minX,
                                                y: scaledRect.minY)
                                }
                            }
                        }
                    )
            }
            // ... PhotosPicker ...
            PhotosPicker("Select Screenshot",
                         selection: $selectedItem,
                         matching: .images)
        }
        .task(id: selectedItem) {
            await viewModel.loadImage(from: selectedItem)
        }
        .padding()
    }

    // 3. Helper to convert pixel-coordinates to view-coordinates
    private func scale(_ rect: CGRect, from imageSize: CGSize, to viewSize: CGSize) -> CGRect {
        let scaleX = viewSize.width / imageSize.width
        let scaleY = viewSize.height / imageSize.height
        
        return CGRect(
            x: rect.origin.x * scaleX,
            y: rect.origin.y * scaleY,
            width: rect.width * scaleX,
            height: rect.height * scaleY
        )
    }
}

#Preview {
    RedactionView()
}
