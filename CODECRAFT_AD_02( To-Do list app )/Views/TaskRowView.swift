//
//  TaskRowView.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import SwiftUI

struct TaskRowView: View {
    let task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .strikethrough(task.isCompleted)
                    .foregroundColor(task.isCompleted ? .secondary : .primary)
                
                Text(task.formattedDateTime)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(task.priority.label)
                    .font(.caption2)
                    .padding(4)
                    .background(task.priority.color.opacity(0.2))
                    .cornerRadius(4)
            }
        }
    }
}

