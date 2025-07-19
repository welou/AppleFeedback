//
//  MenuBarExtraDemoApp.swift
//  MenuBarExtraDemo
//
//  Created by Veli-Matti Hinkula on 17.7.2025.
//

import SwiftUI

@main
struct MenuBarExtraDemoApp: App {
    var body: some Scene {
        
        // Window's contents react to system appearance (light vs dark).
        Window("Demo", id: "regular-window") {
            ContentView()
        }
        
        // MenuBarExtra in .window style always shows contents in dark mode, regardless
        // of system's current appearance setting.
        MenuBarExtra {
            MenuBarContentView()
        } label: {
            Image(systemName: "macwindow")
                .renderingMode(.template)
        }
        .menuBarExtraStyle(.window)
    }
}
