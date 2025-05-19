//
//  DashboardViewData.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation
struct DashboardViewData {
    let fullName: String
    let customerInfo: String
    let monthSpent: Float   
    let monthLimit: String
    let notificationCount: Int
    let newsImages: [String]
    let balances: (tl: String, usd: String, bonus: String)
    let branchName: String
    let isVip: Bool
    let email: String
    let phone: String
}
