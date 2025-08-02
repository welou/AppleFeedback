//
//  Appearance_Test.swift
//  Appearance Test
//
//  Created by Veli-Matti Hinkula on 28.7.2025.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Appearance_TestEntryView : View {
    var entry: Provider.Entry

    /// DEMO: Read environment `ColorScheme`, in order to set the appropriate appearance for the widget.
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading) {
            /// DEMO: Display the time including seconds, so that it's easier to determine whether widget has been re-rendered.
            Text(entry.date, format: Date.FormatStyle(date: .complete, time: .complete))
                .padding(.bottom, 10.0)

            /// DEMO: Display the detected currently selected appearance.
            if colorScheme == .light {
                Text("Environment uses light appearance.")
            } else if colorScheme == .dark {
                Text("Environment uses dark appearance.")
            } else {
                Text("Environment's ColorScheme is nil")
            }
        }

        /// DEMO: Use the environment `ColorScheme` on the widget view.
        /// Note that using `.preferredColorScheme()` is not strictly necessary for this demo app, but this would be needed
        /// in the scenarios where the app allows the user to set an appearance for the widgets which goes against currently
        /// selected system appearance.
        .preferredColorScheme(colorScheme)

        /// DEMO: Setting the `ColorScheme` manually to `.light` has no effect.
        //.preferredColorScheme(.light)

        /// DEMO: Setting the `ColorScheme` manually to `.dark` has no effect.
        //.preferredColorScheme(.dark)

        /// DEMO: Try to adjust widget's appearance based on environment's `ColorScheme`. In this example setting the
        /// background and foreground colors manually depending on environment's appearance. This will not work, because the
        /// current environment `ColorScheme` is always `.light`.
        //.background(colorScheme == .light ? .white : .black)
        //.foregroundColor(colorScheme == .light ? .black : .white)
    }
}

struct Appearance_Test: Widget {
    let kind: String = "Appearance_Test"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(macOS 14.0, *) {
                Appearance_TestEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                Appearance_TestEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Appearance Test")
        .description("Example widget for testing appearance.")
    }
}
