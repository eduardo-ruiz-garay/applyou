//
//  User.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
