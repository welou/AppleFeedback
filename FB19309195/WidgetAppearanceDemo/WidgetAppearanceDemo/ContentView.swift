//
//  ContentView.swift
//  WidgetAppearanceDemo
//
//  Created by Veli-Matti Hinkula on 28.7.2025.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Widget Appearance Demo")
                .font(.title)
                .padding(.bottom, 10.0)

            Text("This demo application includes widget \"Appearance Test\" (implementation: Appearance Test/Appearance_Test.swift).")

            Text("How to test")
                .font(.headline)
            Text("Add the widget \"Appearance Test\" to Notification Center and Desktop. Change system appearance.")

            Text("Expected result")
                .font(.headline)
            Text("The widget should follow system's appearance and render in light appearance when the system is using light appearance, and render in dark appearance when system is using dark appearance.")

            Text("Actual result")
                .font(.headline)
            Text("Instead, on Tahoe (beta 4) the widget always renders in light appearance in Notification Center and on the Desktop, regardless of system appearance. On Sequoia the widget follows system appearance.")

            Button("Refresh Widget", action: {
                /// DEMO: Try to manually refresh the widget timeline.
                WidgetCenter.shared.reloadTimelines(ofKind: "Appearance_Test")
            })
            .padding(.top, 20.0)
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear(perform: {
            /// DEMO: Try to refresh the widget timeline when main app window appears.
            WidgetCenter.shared.reloadTimelines(ofKind: "Appearance_Test")
        })
    }
}

#Preview {
    ContentView()
}
