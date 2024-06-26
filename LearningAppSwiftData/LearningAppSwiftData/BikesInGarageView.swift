//
//  BikesInGarageView.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 14/06/24.
//

import SwiftUI
import SwiftData

struct BikesInGarageView: View {
    @Query private var bikes: [Bike]
    @State private var showAddBikeView = false
    
    var body: some View {
        VStack {
            ForEach(bikes, id: \.name) { bike in
                VStack {
                    Text(bike.name)
                        .font(.system(size: 32))
                    HStack {
                        Text(bike.company)
                            .font(.system(size: 16))
                        Spacer()
                        Text("\(bike.cubicCapacity)")
                            .font(.system(size: 16))
                    }
                }
                
            }
        }
        .navigationTitle("Garage")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddBikeView.toggle()
                } label: {
                    Text("Add")
                }
            }
        }
        .sheet(isPresented: $showAddBikeView, content: {
            AddBikeView()
        })
    }
}

#Preview {
    BikesInGarageView()
}
