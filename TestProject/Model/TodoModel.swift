//
//  TotoModel.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//
import Foundation

// MARK: - TodoModel
struct TodoModel: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
