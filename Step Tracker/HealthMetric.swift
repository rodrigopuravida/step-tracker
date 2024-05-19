//
//  HealthMetric.swift
//  Step Tracker
//
//  Created by Rodrigo Carballo on 5/18/24.
//

import Foundation

struct HealthMetric: Identifiable {
  let id = UUID()
  let date: Date
  let value: Double
}
