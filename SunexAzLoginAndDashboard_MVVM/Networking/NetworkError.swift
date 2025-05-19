//
//  NetworkError.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 17.05.25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingFailed
    case serverError(String)
    case unknown
}
