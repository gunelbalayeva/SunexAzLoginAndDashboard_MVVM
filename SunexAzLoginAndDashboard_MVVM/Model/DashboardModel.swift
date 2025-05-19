//
//  DashboardModel.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation
struct DashboardModel {

    struct User {
        let name: String
        let surname: String
        let customerNumber: Int
        let username: String
        let balanceTL: Double
        let balanceUSD: Double
        let balanceBonus: Double
        let branchName: String
        let isVipUser: Bool
        let email: String
        let phoneNumber: String
    }

    struct NewsItem {
        let id: Int
        let imageUrl: String
    }

    struct DashboardData {
        let user: User
        let currentlyTotalAmountInMonth: Double
        let news: [NewsItem]
        let notificationCount: Int
    }

}
