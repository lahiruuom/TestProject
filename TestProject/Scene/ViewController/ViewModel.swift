//
//  ViewModel.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import Foundation
import Moya

class ViewModel {
    
    // MARK: Properties
    let provider: MoyaProvider<TodoAPI> = MoyaProvider<TodoAPI>(plugins: [NetworkLoggerPlugin()])
    var todoArray: [TodoModel] = [TodoModel]()
    let tableViewHeight = 70
}

// MARK: methods
extension ViewModel {
    
    /**
    Fetch Todo details
     - parameters:
        - completion: returns an event object
        - status: Bool
        - message: String
     */
    func fetchTodos(completion: @escaping(_ status: Bool, _ message: String?) -> Void) {
        provider.request(.getTodo) { (result) in
            switch result {
            case let .success(response):
                do {
                    let dataObject = try response.map([TodoModel].self)
                    self.todoArray = dataObject
                    completion(true, nil)
                } catch {
                    completion(false, "Object maping fail")
                }
            case let .failure(error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
    /**
    Delete Todo
     - parameters:
        - id: Todo ID
        - completion: returns an event object
        - status: Bool
        - message: String
     */
    func deleteTodos(id: Int, completion: @escaping(_ status: Bool, _ message: String?) -> Void) {
        provider.request(.deleteTodo(id: id)) { (result) in
            switch result {
            case .success(_):
                completion(true, nil)
            case let .failure(error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
    
}
