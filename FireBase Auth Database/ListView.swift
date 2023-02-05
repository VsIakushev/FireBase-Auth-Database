//
//  ListView.swift
//  FireBase Auth Database
//
//  Created by Vitaliy Iakushev on 04.02.2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            List(dataManager.stockInfoArray, id: \.id) { stockInfo in
                HStack {
                    Text(stockInfo.ticker)
                    Spacer()
                    Text("\(String(format: "%.1f", stockInfo.share)) %")
                    Spacer()
                    Text("$ \(String(format: "%.1f", stockInfo.amount))")
                    Spacer()
                    Text("$ \(String(format: "%.1f", stockInfo.price))")
                    Spacer()
                    Text("\(String(format: "%.1f", stockInfo.quantity))")
                }
            }
            .navigationTitle("Stocks in Portfolio")

        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())

    }
}
