//
//  ContentView.swift
//  MenuBarExtraDemo
//
//  Created by Veli-Matti Hinkula on 17.7.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10.0) {
            Text("This is a Window.")
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.tint)
                    .tint(.green)
                Text("This view reacts to system appearance (light or dark).")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
