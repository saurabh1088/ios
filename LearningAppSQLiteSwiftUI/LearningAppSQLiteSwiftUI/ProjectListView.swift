//
//  ProjectListView.swift
//  LearningAppSQLiteSwiftUI
//
//  Created by Saurabh Verma on 26/01/26.
//

import SwiftUI

struct ProjectListView: View {
    @StateObject var viewModel = ProjectViewModel()
    @State private var showingAddSheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.projects) { project in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(project.name)
                                .font(.headline)
                            Text("Budget: $\(project.budget, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }
                .onDelete(perform: deleteItems) // SQLite DELETE operation
            }
            .navigationTitle("Architect's Ledger")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { showingAddSheet = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddProjectView(viewModel: viewModel)
            }
            .onAppear {
                viewModel.fetchProjects() // SQLite SELECT operation
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        // We pass the index set to the ViewModel to handle the database removal
        viewModel.deleteProject(at: offsets)
    }
}

#Preview {
    ProjectListView()
}
