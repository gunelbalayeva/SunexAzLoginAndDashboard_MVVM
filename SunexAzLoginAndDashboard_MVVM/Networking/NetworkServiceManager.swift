//
//  NetworkServiceManager.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 17.05.25.

import Foundation
import UIKit
final class NetworkServiceManager {
    
    static let shared = NetworkServiceManager()
    private init() {}
    
    func fetchUsers(completion: @escaping (Result<[UserInfo], NetworkError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "LoginMockResponse", withExtension: "json") else {
            completion(.failure(.invalidURL))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode([UserInfo].self, from: data)
            completion(.success(users))
        } catch {
            completion(.failure(.decodingFailed))
        }
    }

    func fetchDashboard(token: String?, completion: @escaping (Result<DashboardResponse, NetworkError>) -> Void) {
        
        guard let url = Bundle.main.url(forResource: "DashboardMockResponse", withExtension: "json") else {
            completion(.failure(.invalidURL))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(DashboardResponse.self, from: data)
            completion(.success(response))
        } catch {
            print("Decoding error: \(error)")  
            completion(.failure(.decodingFailed))
        }
    }

}
