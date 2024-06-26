//
//  BikeGarageView.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 14/06/24.
//

import SwiftUI

struct BikeGarageView: View {
    @State private var showBikesInGarageView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("🏍️")
                    .font(.system(size: 144))
                Text("Welcome to Bike Garage!!!")
                    .font(.system(size: 28, weight: .heavy))
                
                Button {
                    withAnimation {
                        showBikesInGarageView.toggle()
                    }
                } label: {
                    Text("Enter")
                }

            }
            .navigationDestination(isPresented: $showBikesInGarageView) {
                BikesInGarageView()
            }
        }
    }
}

#Preview {
    BikeGarageView()
}
