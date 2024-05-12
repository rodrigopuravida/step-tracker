//
//  Step_TrackerApp.swift
//  Step Tracker
//
//  Created by Rodrigo Carballo on 5/2/24.
//

import SwiftUI

@main
struct Step_TrackerApp: App {

  let hkManager = HealthKitManager()

    var body: some Scene {
        WindowGroup {
            DashBoardView()
            .environment(hkManager)
        }
    }
}
