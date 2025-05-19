//
//  DashboardViewModel.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//

import Foundation
import Foundation

class DashboardViewModel {
    var dashboard: DashboardResponse?
    
    var fullName: String = ""
    var customerInfo: String = ""
    var currentExpense: String = ""
    var monthlyLimit: String = ""
    var expenseProgress: Float = 0.0
    
    var onDataFetched: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchDashboardData(token: String) {
        NetworkServiceManager.shared.fetchDashboard(token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.dashboard = data
                    self.fullName = data.fullName
                    self.customerInfo = "\(data.customer.serial ?? "") \(data.customer.number ?? "")"
                    self.currentExpense = "\(data.monthlyExpense ?? 0.0) $"
                    self.monthlyLimit = "\(data.monthlyLimit  ?? 0.0) $"
                    
                    let expenseVal = data.monthlyExpense ?? 0.0
                    let limitVal   = data.monthlyLimit   ?? 0.0
                    if limitVal > 0 {
                        let ratio = expenseVal / limitVal
                        
                        self.expenseProgress = Float(min(ratio, 1.0))
                    } else {
                        
                        self.expenseProgress = 0.0
                    }
                    self.onDataFetched?()
                    
                case .failure(let error):
                    self.onError?(error.localizedDescription)
                }
            }
        }
    }
    
    
}
