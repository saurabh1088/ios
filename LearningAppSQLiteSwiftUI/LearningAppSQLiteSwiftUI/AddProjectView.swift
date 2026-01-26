//
//  AddProjectView.swift
//  LearningAppSQLiteSwiftUI
//
//  Created by Saurabh Verma on 26/01/26.
//

import SwiftUI

struct AddProjectView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ProjectViewModel
    
    @State private var name: String = ""
    @State private var budget: String = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Project Name", text: $name)
                TextField("Budget", text: $budget)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Project")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let budgetDouble = Double(budget) {
                            viewModel.addProject(projectName: name, projectBudget: budgetDouble)
                            dismiss()
                        }
                    }
                    .disabled(name.isEmpty || budget.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddProjectView(viewModel: ProjectViewModel())
}
