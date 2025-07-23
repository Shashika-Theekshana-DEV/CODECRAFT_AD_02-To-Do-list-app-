//
//  AddTaskViewModel.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import Foundation
import SwiftData

@MainActor
class AddTaskViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var taskDescription: String = ""
    @Published var priority: Priority = .medium
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = ""
    
    func addTask(context: ModelContext) -> Bool {
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
        
        let newTask = Task(
            title: title,
            taskDescription: taskDescription,
            dueDate: dueDate,
            priority: priority
        )
        
        context.insert(newTask)
        resetForm()
        return true
    }
    
    private func resetForm() {
        title = ""
        taskDescription = ""
        dueDate = Date()
        priority = .medium
    }
}
