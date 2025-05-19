//
//  DashboardResponse.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation

struct DashboardResponse: Decodable {
    let user: UserDetails
    let currentlyTotalAmountInMonth: Double
    let news: [NewsItem]
    let notificationCount: Int
}

struct UserDetails: Decodable {
    let Name: String
    let Surname: String
    let CustomerNumber: Int
    let Username: String
    let BalanceTL: Double
    let BalanceUSD: Double
    let BalanceBonus: Double
    let BranchName: String
    let isVipUser: Bool
    let Email: String
    let PhoneNumber: String
}

struct NewsItem: Decodable {
    let id: Int
    let imageUrl: String
}
