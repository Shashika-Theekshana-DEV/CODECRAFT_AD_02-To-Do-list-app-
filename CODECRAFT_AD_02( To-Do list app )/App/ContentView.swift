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
            ContentView()
                .tabItem{
                 Label("To-Do", systemImage: "list.bullet")
                }
            
            
            SettingsView()
                .tabItem {
                Label("Settings", systemImage: "gear")
                
            }
            
        }
    }
}
#Preview {
    ContentView()
}
