//
//  DashBoardView.swift
//  Step Tracker
//
//  Created by Rodrigo Carballo on 5/2/24.
//

import SwiftUI
import Charts

enum HealthMetricContext: CaseIterable, Identifiable {
  case steps, weight
  var id: Self {self}

  var title: String {
    switch self {
    case .steps:
      return "Steps"
    case .weight:
      return "Weight"
    }
  }
}

struct DashBoardView: View {

  @Environment(HealthKitManager.self) private var hkManager
  @AppStorage("hasSeenPermissionPriming") private var hasSeenPermissionPriming = false
  @State private var isShowingPermissionPrimingSheet = false
  @State private var selectedStat: HealthMetricContext = .steps

  var isSteps : Bool { selectedStat == .steps}

  var body: some View {
    NavigationStack{
      ScrollView{
        VStack(spacing: 20) {

          Picker("Selected Stat", selection: $selectedStat) {
            ForEach(HealthMetricContext.allCases) {
              Text($0.title)
            }
          }
          .pickerStyle(.segmented)

          switch selectedStat {
          case .steps:
            StepBarChart(selectedStat: selectedStat, chartData: hkManager.stepData)
            StepPieChart(chartData: ChartMath.averageWeekdayCount(for: hkManager.stepData))
          case .weight:
            WeightLineChart(selectedStat: selectedStat, chartData: hkManager.weightData)
            WeightDiffBarChart(chartData: ChartMath.averageDailyWeightDiffs(for: hkManager.weightDiffData))
          }



        }
      }
      .padding()
      .task{
        //await hkManager.addSimulatorData()
        await hkManager.fetchWeights()
        await hkManager.fetchStepCount()
        await hkManager.fetchWeightsForDifferentials()
        //ChartMath.averageWeekdayCount(for: hkManager.stepData)
        isShowingPermissionPrimingSheet = !hasSeenPermissionPriming
      }
      .navigationTitle("Dashboard")
      .navigationDestination(for: HealthMetricContext.self) { metric in
        HealthDataListView(metric: metric)
      }
      .sheet(isPresented: $isShowingPermissionPrimingSheet, onDismiss: {
        //fetch health data
      }, content: {
        HealthKitPermissionPrimingView(hasSeen: $hasSeenPermissionPriming)
      })
    }
    .tint(isSteps  ? .pink : .indigo)
  }

  
}

#Preview {
  DashBoardView()
    .environment(HealthKitManager())
}
