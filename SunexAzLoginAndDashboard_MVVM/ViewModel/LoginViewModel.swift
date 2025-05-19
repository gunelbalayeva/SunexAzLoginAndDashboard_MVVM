//
//  LoginViewModel.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 17.05.25.
//

import Foundation
import UIKit

final class LoginViewModel {
    private let networkService = NetworkServiceManager.shared
    
    var onSuccess: ((User, String) -> Void)?
    var onFailure: ((String) -> Void)?
    
    func login(email: String, password: String) {
        networkService.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                if let user = UserAdapter.convert(from: users, email: email, password: password) {
                    self?.onSuccess?(user, "mock_token_\(user.id)")
                } else {
                    self?.onFailure?("Email və ya şifrə yanlışdır")
                }
            case .failure(let error):
                let message: String
                switch error {
                case .invalidURL: message = "URL düzgün deyil"
                case .decodingFailed: message = "Məlumat formatı uyğun gəlmir"
                case .serverError(let msg): message = msg
                case .unknown: message = "Naməlum xəta"
                }
                self?.onFailure?(message)
            }
        }
    }
}
