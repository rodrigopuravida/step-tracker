//
//  ChartDataTypes.swift
//  Step Tracker
//
//  Created by Rodrigo Carballo on 5/25/24.
//

import Foundation

struct WeekdayChartData : Identifiable {
  let id = UUID()
  let date : Date
  let value: Double

}
