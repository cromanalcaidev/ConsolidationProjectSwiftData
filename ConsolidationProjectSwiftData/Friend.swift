//
//  Friend.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 2/5/24.
//

import Foundation


struct Users: Codable, Hashable {
    var userList = [User]()
}

struct User: Codable, Identifiable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable, Identifiable, Hashable {
    var id: String
    var name: String
}
