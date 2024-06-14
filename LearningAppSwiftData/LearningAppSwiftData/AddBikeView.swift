//
//  AddBikeView.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 14/06/24.
//

import SwiftUI

struct AddBikeView: View {
    @ObservedObject var viewModel: BikesViewModel
    @State private var bikeName = String()
    @State private var company = String()
    @State private var engineCC = String()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Name", text: $bikeName)
            TextField("Company", text: $company)
            TextField("Engine cc", text: $engineCC)
            
            Button {
                if let cc = Int(engineCC) {
                    viewModel.add(bike: Bike(name: bikeName, company: company, cubicCapacity: cc))
                    dismiss()
                }
            } label: {
                Text("Add")
            }

        }
    }
}

#Preview {
    AddBikeView(viewModel: BikesViewModel())
}
