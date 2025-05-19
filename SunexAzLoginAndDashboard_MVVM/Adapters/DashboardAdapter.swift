//
//  DashboardAdapter.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation
final class DashboardAdapter {
    static func convert(from response: DashboardResponse) -> DashboardViewData {
        let name = response.user.Name + " " + response.user.Surname
        let info = "#" + String(response.user.CustomerNumber)
        let spentPercent = Float(response.currentlyTotalAmountInMonth / response.user.BalanceTL)
        let monthLimitText = String(format: "%.2f TL", response.user.BalanceTL)
        let balances = (
            tl: String(format: "%.2f TL", response.user.BalanceTL),
            usd: String(format: "%.2f $", response.user.BalanceUSD),
            bonus: String(format: "%.2f Bonus", response.user.BalanceBonus)
        )
        let newsUrls = response.news.map { $0.imageUrl }
        return DashboardViewData(
            fullName: name,
            customerInfo: info,
            monthSpent: spentPercent,
            monthLimit: monthLimitText,
            notificationCount: response.notificationCount,
            newsImages: newsUrls,
            balances: balances,
            branchName: response.user.BranchName,
            isVip: response.user.isVipUser,
            email: response.user.Email,
            phone: response.user.PhoneNumber
        )
    }
}
