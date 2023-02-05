//
//  DataManager.swift
//  FireBase Auth Database
//
//  Created by Vitaliy Iakushev on 05.02.2023.
//

import Foundation
import Firebase

class DataManager: ObservableObject {
    @Published var stockInfoArray: [StockInfo] = []
    @Published var chartDataArray: [ChartData] = []
    
    init() {
        fetchStockInfo()
        fetchChartData()
    }
    
    func fetchChartData() {
        
//        var formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd/yyyy"
        
        chartDataArray.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("ViFInanceChart")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let id = data["id"] as? String ?? ""
                    let value = data["value"] as? Int ?? 0
                    let date = data["date"] as? String ?? ""
                    
                    let chartData = ChartData(id: id, value: value, date: date)
                    self.chartDataArray.append(chartData)
                }
                print(self.chartDataArray)
            }
        }
        
        
    }
    
    func fetchStockInfo() {
        stockInfoArray.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("StockInfo") //название Collection in FireStore
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let ticker = data["ticker"] as? String ?? ""
                    let share = data["share"] as? Double ?? 0.0
                    let amount = data["amount"] as? Double ?? 0.0
                    let price = data["price"] as? Double ?? 0.0
                    let quantity = data["price"] as? Double ?? 0.0
                    
                    let stockInfo = StockInfo(id: id, ticker: ticker, share: share, amount: amount, price: price, quantity: quantity)
                    
                    self.stockInfoArray.append(stockInfo)
                    
                }
                self.stockInfoArray = self.stockInfoArray.sorted(by: { $0.share > $1.share })
            }
            
        }
    }
}
