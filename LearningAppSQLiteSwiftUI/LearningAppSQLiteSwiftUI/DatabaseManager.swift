//
//  DatabaseManager.swift
//  LearningAppSQLiteSwiftUI
//
//  Created by Saurabh Verma on 26/01/26.
//

import Foundation
import SQLite

class DatabaseManager {
    static let shared = DatabaseManager()
    // TODO: Fix this - db property should be private
    public var db: Connection?

    // Table Definitions
    private let projects = Table("projects")
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let budget = Expression<Double>("budget")

    init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            db = try Connection("\(path)/ledger.sqlite3")
            createTables()
        } catch {
            print("Database connection error: \(error)")
        }
    }

    private func createTables() {
        try? db?.run(projects.create(ifNotExists: true) { t in
            t.column(id, primaryKey: .autoincrement)
            t.column(name)
            t.column(budget)
        })
    }
}
