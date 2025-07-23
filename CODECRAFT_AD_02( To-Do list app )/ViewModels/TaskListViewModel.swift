//
//  TaskListViewModel.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import Foundation
import SwiftData

@MainActor
class TaskListViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var filterpriority: Priority?
    @Published var showCompleted: Bool  = true
    

    func  filteredTasks(_ tasks: [Task]) -> [Task] {
        
        var filtered = tasks
        
        if !searchText.isEmpty {
            filtered = filtered.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.taskDescription.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        if let priority = filterpriority {
            filtered = filtered.filter { $0.priority == priority }
            
        }
        
        
        if !showCompleted {
            filtered = filtered.filter { !$0.isCompleted }
        }
        
        return filtered.sorted { $0.priority > $1.priority }
        
    }
    
}
