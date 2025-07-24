//
//  ContentView.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                TaskListView()
            }
            .tabItem {
                Label("Tasks", systemImage: "list.bullet")
            }
            
            NavigationStack {
                AddTaskView()
            }
            .tabItem {
                Label("Add", systemImage: "plus.circle")
            }
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
            
        } // tab view
        } // body
    }


#Preview {
    ContentView()
}
