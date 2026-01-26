//
//  ProjectViewModel.swift
//  LearningAppSQLiteSwiftUI
//
//  Created by Saurabh Verma on 26/01/26.
//

import Foundation
import Combine
import SQLite

class ProjectViewModel: ObservableObject {
    // 1. Published property to notify the View when data changes
    @Published var projects: [Project] = []
    
    // 2. Reference to the Database Manager
    private let dbManager = DatabaseManager.shared
    
    // 3. Definitions for the table and columns
    private let projectsTable = Table("projects")
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let budget = Expression<Double>("budget")

    init() {
        fetchProjects()
    }

    // MARK: - SQLite Operations

    /// READ: Fetches all projects from the database
    func fetchProjects() {
        var fetchedProjects: [Project] = []
        
        do {
            guard let db = dbManager.db else { return }
            
            // SELECT * FROM projects ORDER BY id DESC
            for project in try db.prepare(projectsTable.order(id.desc)) {
                fetchedProjects.append(Project(
                    id: project[id],
                    name: project[name],
                    budget: project[budget]
                ))
            }
            
            // Always update @Published properties on the Main Thread
            DispatchQueue.main.async {
                self.projects = fetchedProjects
            }
        } catch {
            print("Fetch failed: \(error)")
        }
    }

    /// CREATE: Adds a new project and refreshes the list
    func addProject(projectName: String, projectBudget: Double) {
        do {
            guard let db = dbManager.db else { return }
            
            let insert = projectsTable.insert(name <- projectName, budget <- projectBudget)
            try db.run(insert)
            
            // Refresh the list after successful insertion
            fetchProjects()
        } catch {
            print("Insert failed: \(error)")
        }
    }

    /// DELETE: Removes a project by ID
    func deleteProject(at offsets: IndexSet) {
        offsets.forEach { index in
            let project = projects[index]
            do {
                guard let db = dbManager.db else { return }
                let target = projectsTable.filter(id == project.id)
                try db.run(target.delete())
                fetchProjects()
            } catch {
                print("Delete failed: \(error)")
            }
        }
    }
}
