//
//  ChartMath.swift
//  Step Tracker
//
//  Created by Rodrigo Carballo on 5/25/24.
//

import Foundation
import Algorithms

struct ChartMath {

  static func averageWeekdayCount(for metric: [HealthMetric]) -> [WeekdayChartData] {
    let sortedByWeekDay = metric.sorted { $0.date.weekdayInt < $1.date.weekdayInt }
    let weekdayArray = sortedByWeekDay.chunked { $0.date.weekdayInt == $1.date.weekdayInt }

    var weekdayChartData : [WeekdayChartData] = []

    for array in weekdayArray {
      guard let firstValue = array.first else {continue}
      let total = array.reduce(0) {$0 + $1.value }
      let avgSteps = total/Double(array.count)

      weekdayChartData.append(.init(date: firstValue.date, value: avgSteps))
    }

    for metric in sortedByWeekDay {
      print("Day: \(metric.date.weekdayInt), value: \(metric.value)")
    }

    print("----------")

    for day in weekdayChartData {
      print("Day: \(day.date.weekdayInt), value: \(day.value)")
    }


    return weekdayChartData

  }
}
