//
//  HealthKitManager.swift
//  Step Tracker
//
//  Created by Rodrigo Carballo on 5/12/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {

  let store = HKHealthStore()

  let types  : Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]

  
}
