//
//  EditTaskView.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import SwiftUI
import SwiftData

struct EditTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel: EditTaskViewModel
    
    init(task: Task) {
        _viewModel = StateObject(wrappedValue: EditTaskViewModel(task: task))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $viewModel.title)
                    DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
                    DatePicker("Time", selection: $viewModel.dueDate, displayedComponents: .hourAndMinute)
                    TextField("Description", text: $viewModel.taskDescription)
                    
                    Picker("Priority", selection: $viewModel.priority) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.label)
                                .tag(priority)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Button("Save Changes") {
                        if viewModel.updateTask(context: context) {
                            dismiss()
                        }
                    }
                    .disabled(viewModel.title.isEmpty)
                    
                    Button("Delete Task", role: .destructive) {
                        // Access the task through the viewModel's public method
                        if let taskToDelete = viewModel.getTask() {
                            context.delete(taskToDelete)
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Edit Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .alert("Error", isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
}
