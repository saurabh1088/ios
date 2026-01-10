//
//  TodoDetailViewController.swift
//  LearningAppUsingCursorUIKit
//
//  Created by Saurabh Verma on 11/12/25.
//

import UIKit
import CoreData

class TodoDetailViewController: UIViewController {
    
    // MARK: - Properties
    private var todo: TodoItem
    private var isEditingMode = false
    
    // MARK: - UI Components
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var titleLabel: UILabel!
    private var titleTextField: UITextField!
    private var descriptionLabel: UILabel!
    private var descriptionTextView: UITextView!
    private var completionSwitch: UISwitch!
    private var completionLabel: UILabel!
    private var createdAtLabel: UILabel!
    private var editButton: UIBarButtonItem!
    private var saveButton: UIBarButtonItem!
    private var cancelButton: UIBarButtonItem!
    
    // MARK: - Core Data
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to get AppDelegate")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - Initialization
    init(todo: TodoItem) {
        self.todo = todo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
        setupKeyboardHandling()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        title = "Todo Details"
        view.backgroundColor = .systemBackground
        
        // Setup Scroll View
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        view.addSubview(scrollView)
        
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // Setup Title Label
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Title"
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(titleLabel)
        
        // Setup Title Text Field
        titleTextField = UITextField()
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.borderStyle = .roundedRect
        titleTextField.font = .systemFont(ofSize: 16)
        titleTextField.isEnabled = false
        contentView.addSubview(titleTextField)
        
        // Setup Description Label
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Description"
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(descriptionLabel)
        
        // Setup Description Text View
        descriptionTextView = UITextView()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.font = .systemFont(ofSize: 16)
        descriptionTextView.layer.borderColor = UIColor.separator.cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.isEditable = false
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        contentView.addSubview(descriptionTextView)
        
        // Setup Completion Switch
        completionSwitch = UISwitch()
        completionSwitch.translatesAutoresizingMaskIntoConstraints = false
        completionSwitch.addTarget(self, action: #selector(completionSwitchChanged), for: .valueChanged)
        contentView.addSubview(completionSwitch)
        
        completionLabel = UILabel()
        completionLabel.translatesAutoresizingMaskIntoConstraints = false
        completionLabel.text = "Completed"
        completionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        contentView.addSubview(completionLabel)
        
        // Setup Created At Label
        createdAtLabel = UILabel()
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        createdAtLabel.font = .systemFont(ofSize: 14)
        createdAtLabel.textColor = .secondaryLabel
        contentView.addSubview(createdAtLabel)
        
        // Setup Navigation Buttons
        editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
        saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        
        navigationItem.rightBarButtonItem = editButton
        
        // Setup Constraints
        NSLayoutConstraint.activate([
            // Scroll View
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Content View
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Title Text Field
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 44),
            
            // Description Label
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Description Text View
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 120),
            
            // Completion Label
            completionLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 24),
            completionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            // Completion Switch
            completionSwitch.centerYAnchor.constraint(equalTo: completionLabel.centerYAnchor),
            completionSwitch.leadingAnchor.constraint(equalTo: completionLabel.trailingAnchor, constant: 16),
            
            // Created At Label
            createdAtLabel.topAnchor.constraint(equalTo: completionLabel.bottomAnchor, constant: 24),
            createdAtLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            createdAtLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            createdAtLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - UI Updates
    private func updateUI() {
        titleTextField.text = todo.title ?? ""
        descriptionTextView.text = todo.todoDescription ?? ""
        completionSwitch.isOn = todo.isCompleted
        
        // Format created date
        if let createdAt = todo.createdAt {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            createdAtLabel.text = "Created: \(formatter.string(from: createdAt))"
        }
        
        setEditingMode(isEditingMode)
    }
    
    private func setEditingMode(_ editing: Bool) {
        isEditingMode = editing
        titleTextField.isEnabled = editing
        descriptionTextView.isEditable = editing
        
        if editing {
            navigationItem.rightBarButtonItems = [saveButton, cancelButton]
            titleTextField.becomeFirstResponder()
        } else {
            navigationItem.rightBarButtonItems = [editButton]
            titleTextField.resignFirstResponder()
            descriptionTextView.resignFirstResponder()
        }
    }
    
    // MARK: - Keyboard Handling
    private func setupKeyboardHandling() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
    
    // MARK: - Actions
    @objc private func editButtonTapped() {
        setEditingMode(true)
    }
    
    @objc private func saveButtonTapped() {
        guard let title = titleTextField.text?.trimmingCharacters(in: .whitespaces),
              !title.isEmpty else {
            showAlert(title: "Error", message: "Title cannot be empty")
            return
        }
        
        todo.title = title
        todo.todoDescription = descriptionTextView.text.trimmingCharacters(in: .whitespaces).isEmpty ? nil : descriptionTextView.text.trimmingCharacters(in: .whitespaces)
        
        do {
            try context.save()
            setEditingMode(false)
            updateUI()
            
            // Notify parent view controller to refresh
            NotificationCenter.default.post(name: NSNotification.Name("TodoUpdated"), object: nil)
        } catch {
            print("Error saving todo: \(error)")
            showAlert(title: "Error", message: "Failed to save changes")
        }
    }
    
    @objc private func cancelButtonTapped() {
        // Reset to original values
        titleTextField.text = todo.title ?? ""
        descriptionTextView.text = todo.todoDescription ?? ""
        setEditingMode(false)
    }
    
    @objc private func completionSwitchChanged() {
        todo.isCompleted = completionSwitch.isOn
        
        do {
            try context.save()
            NotificationCenter.default.post(name: NSNotification.Name("TodoUpdated"), object: nil)
        } catch {
            print("Error updating todo completion: \(error)")
            showAlert(title: "Error", message: "Failed to update completion status")
            // Revert switch
            completionSwitch.isOn = todo.isCompleted
        }
    }
    
    // MARK: - Helpers
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
