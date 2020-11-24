//
//  TodosAPI.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import Foundation
import Moya

enum TodoAPI {
    case getTodo
    case updateTodo(userId: Int,
                    id: Int,
                    title: String,
                    completed: Bool)
    case createTodo(userId: Int,
                    id: Int,
                    title: String,
                    completed: Bool)
    case deleteTodo(id: Int)
}

extension TodoAPI: TargetType {
    
    var environment: APIEnvironment {
        NetworkManager.environment
    }
    
    public var baseURL: URL {
        guard let url = URL(string: environment.baseURL) else { fatalError("base url not configured") }
        return url
    }
    
    public var path: String {
        switch self {
        case .getTodo:
            return "/todos"
        case .updateTodo( _, let id, _, _):
            return "/todos/\(id)"
        case .createTodo( _, _, _, _):
            return "/todos"
        case .deleteTodo(let id):
            return "/todos/\(id)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getTodo:
            return .get
        case .updateTodo( _, _, _, _):
            return .put
        case .createTodo( _, _, _, _):
            return .post
        case .deleteTodo( _):
            return .delete
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getTodo:
            return .requestPlain
        case .updateTodo(let userId,
                         let id,
                         let title,
                         let completed):
            return .requestParameters(
                parameters: [
                    "userId": userId,
                    "id": id,
                    "title": title,
                    "completed": completed
                ],
                encoding: JSONEncoding.default)
        case .createTodo(let userId,
                         let id,
                         let title,
                         let completed):
            return .requestParameters(
                parameters: [
                    "userId": userId,
                    "id": id,
                    "title": title,
                    "completed": completed
                ],
                encoding: JSONEncoding.default)
        case .deleteTodo( _):
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        
        let params = ["Content-Type": "application/json"]
        
        switch self {
        case .getTodo ,
             .updateTodo( _, _, _, _) ,
             .createTodo( _, _, _, _),
             .deleteTodo( _) :
            return params
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

