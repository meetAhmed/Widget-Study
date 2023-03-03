//
//  MonthlyConfig.swift
//  WidgetDemo
//
//  Created by Ahmed Ali on 03/03/2023.
//

import SwiftUI

struct MonthlyConfig {
    let backgroundColor: Color
    let emojiText: String
    let weekDayTextColor: Color
    let dayTextColor: Color
    
    static func determineConfig(from date: Date) -> MonthlyConfig {
        let monthInt = Calendar.current.component(.month, from: date)
        switch monthInt {
        case 1:
            return MonthlyConfig(
                backgroundColor: .blue,
                emojiText: "❄️",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 2:
            return MonthlyConfig(
                backgroundColor: .yellow,
                emojiText: "🌨",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 3:
            return MonthlyConfig(
                backgroundColor: .green,
                emojiText: "🌺",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 4:
            return MonthlyConfig(
                backgroundColor: .pink,
                emojiText: "🌞",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 5:
            return MonthlyConfig(
                backgroundColor: .gray,
                emojiText: "❤️",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 6:
            return MonthlyConfig(
                backgroundColor: .red,
                emojiText: "🚤",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 7:
            return MonthlyConfig(
                backgroundColor: .cyan,
                emojiText: "🍁",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 8:
            return MonthlyConfig(
                backgroundColor: .orange,
                emojiText: "🧣",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 9:
            return MonthlyConfig(
                backgroundColor: .yellow,
                emojiText: "⚽️",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 10:
            return MonthlyConfig(
                backgroundColor: .brown,
                emojiText: "💎",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 11:
            return MonthlyConfig(
                backgroundColor: .purple,
                emojiText: "✨",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        case 12:
            return MonthlyConfig(
                backgroundColor: .indigo,
                emojiText: "🍩",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        default:
            return MonthlyConfig(
                backgroundColor: .blue,
                emojiText: "❄️",
                weekDayTextColor: .white,
                dayTextColor: .white
            )
        }
    }
}
