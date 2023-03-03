//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Ahmed Ali on 03/03/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (DayEntry) -> ()) {
        let entry = DayEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [DayEntry] = []
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let startOfDay = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(date: startOfDay)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct DayEntry: TimelineEntry {
    let date: Date
}

struct MonthlyWidgetEntryView : View {
    var entry: DayEntry
    var monthlyConfig: MonthlyConfig
    
    init(entry: DayEntry) {
        self.entry = entry
        self.monthlyConfig = MonthlyConfig.determineConfig(from: entry.date)
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [monthlyConfig.backgroundColor],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack {
                HStack(spacing: 5) {
                    Text(monthlyConfig.emojiText)
                        .font(.title)
                    
                    Text(entry.date.formatted(.dateTime.weekday(.wide)))
                        .font(.title3)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(monthlyConfig.weekDayTextColor)
                    
                    Spacer()
                }
                Text(entry.date.formatted(.dateTime.day()))
                    .font(.system(size: 80, weight: .heavy))
                    .foregroundColor(monthlyConfig.dayTextColor)
            }
            .padding()
        }
    }
}

struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("Theme of widget changes with month.")
        .supportedFamilies([.systemSmall])
    }
}

struct MonthlyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 1, day: 25)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
    
    static func dateToDisplay(month: Int, day: Int) -> Date {
        let component = DateComponents(calendar: Calendar.current, year: 2023, month: month, day: day)
        return Calendar.current.date(from: component)!
    }
}
