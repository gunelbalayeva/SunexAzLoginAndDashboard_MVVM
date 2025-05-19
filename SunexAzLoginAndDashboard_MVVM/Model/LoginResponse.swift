//
//  LoginResponse.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 17.05.25.
//

import Foundation
struct LoginResponse: Decodable {
    let users: [UserInfo]
}

struct UserInfo: Decodable {
    let id: Int
    let name: String
    let email: String
    let password: String
    let username: String
}
