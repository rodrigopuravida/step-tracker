//
//  Date+Ext.swift
//  Step Tracker
//
//  Created by Rodrigo Carballo on 5/25/24.
//

import Foundation

extension Date {
  var weekdayInt: Int {
    Calendar.current.component(.weekday, from: self)
  }
}
