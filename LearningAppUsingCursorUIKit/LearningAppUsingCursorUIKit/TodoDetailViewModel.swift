//
//  TodoDetailViewModel.swift
//  LearningAppUsingCursorUIKit
//
//  Created by Saurabh Verma on 11/12/25.
//

import Foundation
import CoreData

protocol TodoDetailViewModelDelegate: AnyObject {
    func viewModelDidUpdateTodo(_ viewModel: TodoDetailViewModel)
    func viewModel(_ viewModel: TodoDetailViewModel, didEncounterError error: Error)
}

class TodoDetailViewModel {
    
    // MARK: - Properties
    private let todo: TodoItem
    private let context: NSManagedObjectContext
    weak var delegate: TodoDetailViewModelDelegate?
    
    // MARK: - Computed Properties
    var title: String {
        todo.title ?? ""
    }
    
    var description: String {
        todo.todoDescription ?? ""
    }
    
    var isCompleted: Bool {
        todo.isCompleted
    }
    
    var createdAt: Date? {
        todo.createdAt
    }
    
    var formattedCreatedDate: String {
        guard let createdAt = todo.createdAt else {
            return "Created: Unknown"
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return "Created: \(formatter.string(from: createdAt))"
    }
    
    // MARK: - Initialization
    init(todo: TodoItem, context: NSManagedObjectContext) {
        self.todo = todo
        self.context = context
    }
    
    // MARK: - Business Logic
    
    /// Updates the todo title and description
    /// - Parameters:
    ///   - title: The new title (must not be empty)
    ///   - description: The new description (optional)
    /// - Returns: Success status and optional error message
    func updateTodo(title: String, description: String?) -> (success: Bool, errorMessage: String?) {
        // Validate title
        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
        guard !trimmedTitle.isEmpty else {
            return (false, "Title cannot be empty")
        }
        
        // Update todo properties
        todo.title = trimmedTitle
        let trimmedDescription = description?.trimmingCharacters(in: .whitespaces)
        todo.todoDescription = trimmedDescription?.isEmpty == false ? trimmedDescription : nil
        
        // Save to Core Data
        do {
            try context.save()
            delegate?.viewModelDidUpdateTodo(self)
            return (true, nil)
        } catch {
            let errorMessage = "Failed to save changes"
            delegate?.viewModel(self, didEncounterError: error)
            return (false, errorMessage)
        }
    }
    
    /// Toggles the completion status of the todo
    /// - Returns: Success status and optional error message
    func toggleCompletion() -> (success: Bool, errorMessage: String?) {
        todo.isCompleted.toggle()
        
        do {
            try context.save()
            delegate?.viewModelDidUpdateTodo(self)
            return (true, nil)
        } catch {
            // Revert the change on error
            todo.isCompleted.toggle()
            let errorMessage = "Failed to update completion status"
            delegate?.viewModel(self, didEncounterError: error)
            return (false, errorMessage)
        }
    }
    
    /// Sets the completion status of the todo
    /// - Parameter isCompleted: The new completion status
    /// - Returns: Success status and optional error message
    func setCompletion(_ isCompleted: Bool) -> (success: Bool, errorMessage: String?) {
        guard todo.isCompleted != isCompleted else {
            return (true, nil) // No change needed
        }
        
        todo.isCompleted = isCompleted
        
        do {
            try context.save()
            delegate?.viewModelDidUpdateTodo(self)
            return (true, nil)
        } catch {
            // Revert the change on error
            todo.isCompleted = !isCompleted
            let errorMessage = "Failed to update completion status"
            delegate?.viewModel(self, didEncounterError: error)
            return (false, errorMessage)
        }
    }
}
