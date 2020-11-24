//
//  NetworkManager.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import Foundation

enum APIEnvironment {
    
    case dev
    
    var baseURL: String {
        switch NetworkManager.environment {
        case .dev:
            return Config.API.DEV.HOST
        }
    }
}

struct NetworkManager {
    static let environment: APIEnvironment = .dev
}
