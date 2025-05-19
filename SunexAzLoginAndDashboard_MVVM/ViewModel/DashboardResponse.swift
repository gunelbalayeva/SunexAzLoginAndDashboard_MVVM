//
//  DashboardResponse.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation
struct DashboardResponse: Codable {
    
    let fullName: String
    let customer: Customer
    let monthlyExpense: Double?
    let monthlyLimit: Double?
    let news: [NewsItem]
}

struct Customer: Codable {
    let serial: String?
    let number: String?
}

struct NewsItem: Codable {
    let id: Int32
    let imageUrl: String
}
