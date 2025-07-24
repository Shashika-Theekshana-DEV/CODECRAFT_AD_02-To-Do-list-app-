//
//  TaskListView.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    @Query private var tasks: [Task]
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = TaskListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredTasks(tasks)) { task in
                    NavigationLink {
                        EditTaskView(task: task)
                    } label: {
                        TaskRowView(task: task)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            context.delete(task)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            task.isCompleted.toggle()
                        } label: {
                            Label(
                                task.isCompleted ? "Undo" : "Complete",
                                systemImage: task.isCompleted ? "arrow.uturn.backward" : "checkmark"
                            )
                        }
                        .tint(task.isCompleted ? .gray : .green)
                    }
                }
            }
            .navigationTitle("Tasks")
            .searchable(text: $viewModel.searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Priority", selection: $viewModel.filterpriority) {
                            Text("All").tag(nil as Priority?)
                            ForEach(Priority.allCases) { priority in
                                Text(priority.label).tag(priority as Priority?)
                            }
                        }
                        
                        Toggle("Show Completed", isOn: $viewModel.showCompleted)
                    } label: {
                        Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}
