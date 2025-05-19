//
//  UserAdapter.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 17.05.25.
//

import Foundation

final class UserAdapter {
    static func convert(from users: [UserInfo], email: String, password: String) -> User? {
        if let matchedUser = users.first(where: { $0.email == email && $0.password == password }) {
            return User(id: matchedUser.id, name: matchedUser.name, email: matchedUser.email)
        }
        return nil
    }
}
