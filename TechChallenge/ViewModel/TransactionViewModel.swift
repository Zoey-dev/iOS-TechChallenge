//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Princess  on 02/03/2022.
//

import Foundation
import SwiftUI

class TransactionViewModel: ObservableObject {
    @Published var allCategory: [TransactionModel] = []
    @Published var headerButtons: [String] = ["all", "food", "health", "entertainment", "shopping", "travel"]
    @Published var allHeaderData: [HeaderButtons] = []
    @Published var singleCategory: [TransactionModel] = []
    @Published var total: Double = 0
    @Published var category: String = "all"
    @Published var categoryColor: HeaderButtons?
    
    init() {
        getHeaderButtons()
        getEachCategory(eachCategory: "all")
        calculateTotalAmount(eachCategory: "all")
        categoryColor = allHeaderData.first
        
    }
    
    func getHeaderButtons() {
        headerButtons.forEach { res in
            if res == "all" {
                allCategory.append(contentsOf: ModelData.sampleTransactions)
                allHeaderData.append(HeaderButtons(id: 1, category: "all", data: allCategory))
            } else if res == "food" {
                allHeaderData.append(HeaderButtons(id: 2, category: "food", data:  allCategory.filter{ $0.category == .food}))
                
            } else if res == "health" {
                allHeaderData.append(HeaderButtons(id: 3, category: "health", data:  allCategory.filter{ $0.category == .health}))
                
            } else if res == "entertainment" {
                allHeaderData.append(HeaderButtons(id: 4, category: "entertainment", data:  allCategory.filter{ $0.category == .entertainment}))
            } else if res == "shopping" {
                allHeaderData.append(HeaderButtons(id: 5, category: "shopping", data:  allCategory.filter{ $0.category == .shopping}))
            } else if res == "travel" {
                allHeaderData.append(HeaderButtons(id: 6, category: "travel", data:  allCategory.filter{ $0.category == .travel}))
            }
        }
        
    }
    
    func getHeaderColors(color: HeaderButtons?) -> Color {
        
        guard let color = color else { return .clear}
        
        if color.category == "all" {
            return .black
        }
        if color.category == "food" {
            return color.data.first?.category.color ?? .clear
        }
        else if color.category == "health" {
            return color.data.first?.category.color ?? .clear
        }
        else if color.category == "entertainment" {
            return color.data.first?.category.color ?? .clear
        }
        else if color.category == "shopping" {
            return color.data.first?.category.color ?? .clear
        }
        else if color.category == "travel" {
            return color.data.first?.category.color ?? .clear
        }
        else {
            return .clear
        }
    }
    
    func getEachCategory(eachCategory: String) {
        category = eachCategory
        allHeaderData.forEach{ res in
            if eachCategory == res.category {
                singleCategory = res.data
            }
        }
    }
    
    func calculateTotalAmount(eachCategory: String) {
        allHeaderData.forEach{ res in
            if eachCategory == res.category {
                for i in singleCategory {
                    if i.pin {
                        total = total - i.amount
                        break
                    } else {
                        total = total + i.amount
                    }
                }
            }
        }
    }
    
    
}
