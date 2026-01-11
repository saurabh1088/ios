//
//  ViewController.swift
//  LearningAppUsingCursorUIKit
//
//  Created by Saurabh Verma on 11/12/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var tableView: UITableView!
    private var addButton: UIBarButtonItem!
    private var todos: [TodoItem] = []
    
    // MARK: - Core Data
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to get AppDelegate")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTodos()
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        title = "Todo List"
        view.backgroundColor = .systemBackground
        
        // Setup Table View
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
        view.addSubview(tableView)
        
        // Setup Add Button
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodoTapped))
        navigationItem.rightBarButtonItem = addButton
        
        // Setup Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Core Data Operations
    private func fetchTodos() {
        let request: NSFetchRequest<TodoItem> = TodoItem.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        
        do {
            todos = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Error fetching todos: \(error)")
            showAlert(title: "Error", message: "Failed to load todos")
        }
    }
    
    private func saveTodo(title: String) {
        let todo = TodoItem(context: context)
        todo.title = title
        todo.isCompleted = false
        todo.createdAt = Date()
        
        do {
            try context.save()
            fetchTodos()
        } catch {
            print("Error saving todo: \(error)")
            showAlert(title: "Error", message: "Failed to save todo")
        }
    }
    
    private func toggleTodoCompletion(_ todo: TodoItem) {
        todo.isCompleted.toggle()
        
        do {
            try context.save()
            fetchTodos()
        } catch {
            print("Error updating todo: \(error)")
            showAlert(title: "Error", message: "Failed to update todo")
        }
    }
    
    private func deleteTodo(_ todo: TodoItem) {
        context.delete(todo)
        
        do {
            try context.save()
            fetchTodos()
        } catch {
            print("Error deleting todo: \(error)")
            showAlert(title: "Error", message: "Failed to delete todo")
        }
    }
    
    // MARK: - Actions
    @objc private func addTodoTapped() {
        let alert = UIAlertController(title: "New Todo", message: "Enter a new todo item", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Todo item"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let textField = alert.textFields?.first,
                  let text = textField.text,
                  !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            self?.saveTodo(title: text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    // MARK: - Notifications
    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(todoUpdated),
            name: NSNotification.Name("TodoUpdated"),
            object: nil
        )
    }
    
    @objc private func todoUpdated() {
        fetchTodos()
    }
    
    // MARK: - Helpers
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let todo = todos[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = todo.title
        content.textProperties.color = todo.isCompleted ? .systemGray : .label
        
        cell.contentConfiguration = content
        cell.accessoryType = todo.isCompleted ? .checkmark : .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let todo = todos[indexPath.row]
        let detailVC = TodoDetailViewController(todo: todo)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todo = todos[indexPath.row]
            deleteTodo(todo)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let todo = todos[indexPath.row]
        
        // Edit action
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] _, _, completionHandler in
            let detailVC = TodoDetailViewController(todo: todo)
            self?.navigationController?.pushViewController(detailVC, animated: true)
            completionHandler(true)
        }
        editAction.image = UIImage(systemName: "pencil")
        editAction.backgroundColor = .systemBlue
        
        // Delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completionHandler in
            self?.deleteTodo(todo)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        // Complete/Incomplete action
        let toggleAction = UIContextualAction(style: .normal, title: todo.isCompleted ? "Incomplete" : "Complete") { [weak self] _, _, completionHandler in
            self?.toggleTodoCompletion(todo)
            completionHandler(true)
        }
        toggleAction.image = UIImage(systemName: todo.isCompleted ? "circle" : "checkmark.circle.fill")
        toggleAction.backgroundColor = todo.isCompleted ? .systemOrange : .systemGreen
        
        return UISwipeActionsConfiguration(actions: [deleteAction, toggleAction, editAction])
    }
}

