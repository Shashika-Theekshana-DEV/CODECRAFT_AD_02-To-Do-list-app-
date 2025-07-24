//
//  SettingsView.swift
//  CODECRAFT_AD_02( To-Do list app )
//
//  Created by shashika theekshana on BE 2568-07-22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("notificationsEnables") private var notificationsEnabled: Bool = true
    @AppStorage("defaultPriority") private var defaultPriority: Priority = .medium
    var body: some View {
        Form {
            Section(header: Text("Preferences")) {
                Toggle("Enable Notifications", isOn: $notificationsEnabled)
                
                Picker("Default Priority", selection: $defaultPriority) {
                    ForEach(Priority.allCases) { Priority in
                        Text(Priority.label).tag(Priority)
                    }
                }
            }
            Section(header: Text("About")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundStyle(.secondary)
                }
                Link("Privacy Policy", destination: URL(string: "https://www.apple.com/privacy/")!)
                Link("Terms of Service", destination: URL(string: "https://www.apple.com/legal/terms/")!)
                
            }
        } // form
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
