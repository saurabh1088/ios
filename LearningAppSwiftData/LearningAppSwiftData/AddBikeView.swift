//
//  AddBikeView.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 14/06/24.
//

import SwiftUI

struct AddBikeView: View {
    @State private var bikeName = String()
    @State private var company = String()
    @State private var engineCC = String()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Name", text: $bikeName)
            TextField("Company", text: $company)
            TextField("Engine cc", text: $engineCC)
            
            Button {
                if let cc = Int(engineCC) {
                    let newBike = Bike(name: bikeName, company: company, cubicCapacity: cc)
                    modelContext.insert(newBike)
                    dismiss()
                }
            } label: {
                Text("Add")
            }

        }
    }
}

#Preview {
    AddBikeView()
}
