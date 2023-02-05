//
//  ChartView.swift
//  FireBase Auth Database
//
//  Created by Vitaliy Iakushev on 05.02.2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        
        Chart {
            ForEach(dataManager.chartDataArray) {
                LineMark(
                    x: .value("Month", $0.date),
                    y: .value("Value V", $0.value)
//                    series: .value("ViFinance", "ViFinance")
                )
                .foregroundStyle(.blue)
            }
        }
        .chartYScale(domain: 900000...1300000) // min max значения рассчитывать, исходя из мин/макс индексов, и подставлять сюда
//            .chartYAxis(.hidden)
        .padding()
        .padding([.top, .bottom], 20)
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(DataManager())
    }
}
