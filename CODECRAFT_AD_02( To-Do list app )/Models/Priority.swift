//
//  Priority.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import Foundation
import SwiftUI

enum Priority: String, CaseIterable, Codable, Identifiable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case urgent = "Urgent"
    
    var id: String { self.rawValue }
    
    var label: String {
        switch self {
        case .low:
            return "Low"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        case .urgent:
            return "Urgent"
        }
        
    }
    
    var color: Color {
        switch self {
        case .low:
            return .green
        case .medium:
            return .yellow
        case .high:
            return .orange
        case .urgent:
            return .red
        }
    }
}

extension Priority: Comparable {
    static func < (lhs: Priority, rhs: Priority) -> Bool {
        let order: [Priority] = [.urgent , .high , .medium , .low]
        return order.firstIndex(of: lhs)! < order.firstIndex(of: rhs)!
        
    }
}
