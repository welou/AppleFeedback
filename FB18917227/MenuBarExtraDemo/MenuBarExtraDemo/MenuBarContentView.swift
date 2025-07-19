//
//  MenuBarContentView.swift
//  MenuBarExtraDemo
//
//  Created by Veli-Matti Hinkula on 17.7.2025.
//

import SwiftUI

struct MenuBarContentView: View {
    var body: some View {
        VStack(spacing: 10.0) {
            Text("This is a MenuBarExtra shown in .window style.")
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.tint)
                    .tint(.red)
                Text("This view is always rendered in dark appearance, regardless of system appearance.")
            }
        }
        .padding()
        
        /// According to .windowBackground documentation:
        ///
        /// > On macOS, this has a unique appearance compared to the default
        /// > `ShapeStyle.background`. It matches the default background of a
        /// > window: a wallpaper-tinted light gray in the light appearance and a
        /// > wallpaper-tinted dark gray in the dark appearance.
        ///
        /// But when used on a view inside MenuBarExtra which is using the .window style, this
        /// background always results in a dark appearance background.
        .background(.windowBackground)
        
        // Even forcing light appearance still renders the view as if it is in dark mode.
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
