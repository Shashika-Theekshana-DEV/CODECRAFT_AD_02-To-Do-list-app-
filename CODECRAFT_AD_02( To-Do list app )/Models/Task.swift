//
//  Task.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//
import Foundation
import SwiftData

@Model
final class Task: Identifiable {
    var title: String
    var taskDescription: String
    var dueDate: Date
    var createdAt: Date
    var isCompleted: Bool
    var priority: Priority
    
    init(
        title: String,
        taskDescription: String = "",
        dueDate: Date = .now,
        createdAt: Date = .now,
        isCompleted: Bool = false,
        priority: Priority = .medium
    ) {
        self.title = title
        self.taskDescription = taskDescription
        self.dueDate = dueDate
        self.createdAt = createdAt
        self.isCompleted = isCompleted
        self.priority = priority
    }
    
    var formattedDateTime: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: dueDate)
    }
}
