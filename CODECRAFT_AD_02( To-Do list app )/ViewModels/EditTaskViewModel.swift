//
//  EditTaskViewModel.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import Foundation
import SwiftData

@MainActor
class EditTaskViewModel: ObservableObject {
    @Published var title: String
    @Published var dueDate: Date
    @Published var taskDescription: String
    @Published var priority: Priority
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = ""
    
    private var task: Task
    
    init(task: Task) {
        self.task = task
        self.title = task.title
        self.dueDate = task.dueDate
        self.taskDescription = task.taskDescription
        self.priority = task.priority
    }
    
    func getTask() -> Task? {
        return task
    }
    
    func updateTask(context: ModelContext) -> Bool {
        guard !title.isEmpty else {
            errorMessage = "Title cannot be empty"
            showAlert = true
            return false
        }
        
        guard dueDate > Date() else {
            errorMessage = "Due date must be in the future"
            showAlert = true
            return false
        }
        
        task.title = title
        task.taskDescription = taskDescription
        task.dueDate = dueDate
        task.priority = priority
        
        do {
            try context.save()
            return true
        } catch {
            errorMessage = "Failed to save changes"
            showAlert = true
            return false
        }
    }
}
