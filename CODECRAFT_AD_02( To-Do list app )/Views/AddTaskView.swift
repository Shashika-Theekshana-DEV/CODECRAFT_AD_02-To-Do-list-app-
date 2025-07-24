//
//  AddTaskView.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = AddTaskViewModel()
    @FocusState private var focusedField: Field?
    
    enum Field {
        case title, description
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $viewModel.title)
                        .focused($focusedField, equals: .title)
                        .submitLabel(.next)
                    
                    DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
                    DatePicker("Time", selection: $viewModel.dueDate, displayedComponents: .hourAndMinute)
                    
                    TextField("Description", text: $viewModel.taskDescription)
                        .focused($focusedField, equals: .description)
                        .submitLabel(.done)
                    
                    Picker("Priority", selection: $viewModel.priority) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.label)
                                .tag(priority)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Button(action: {
                        if viewModel.addTask(context: context) {
                            dismiss()
                        }
                    }) {
                        Text("Add Task")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(viewModel.title.isEmpty)
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        focusedField = nil // Dismiss keyboard
                        dismiss()
                    }
                }
            }
            .onSubmit {
                switch focusedField {
                case .title:
                    focusedField = .description
                default:
                    focusedField = nil
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
