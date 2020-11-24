//
//  TodoAddAndUpdateViewModel.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import Foundation
import UIKit
import Moya

enum EditViewType {
    case add
    case update
}

class TodoAddAndUpdateViewModel {
    
    // MARK: Properties
    let provider: MoyaProvider<TodoAPI> = MoyaProvider<TodoAPI>(plugins: [NetworkLoggerPlugin()])
    var editViewType: EditViewType = .add
    let visibleAlpha: CGFloat = 0.5
    var todoObject: TodoModel?
    
    init(editViewType: EditViewType, todoObject: TodoModel?) {
        self.editViewType = editViewType
        self.todoObject = todoObject
    }
    
}

// MARK: methods
extension TodoAddAndUpdateViewModel {
    
    /**
    Create Todo
     - parameters:
        - userId: User ID
        - id: Todo ID
        - title: title
        - completed: Todo completed or not
        - completion: returns an event object
        - status: Bool
        - message: String
     */
    func createTodos(userId: Int, id: Int, title: String,  completed: Bool, completion: @escaping(_ status: Bool, _ message: String?) -> Void) {
        provider.request(.createTodo(userId: userId, id: id, title: title, completed: completed)) { (result) in
            switch result {
            case .success(_):
                completion(true, nil)
            case let .failure(error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
    /**
    Update Todo
     - parameters:
        - userId: User ID
        - id: Todo ID
        - title: title
        - completed: Todo completed or not
        - completion: returns an event object
        - status: Bool
        - message: String
     */
    func updateTodos(userId: Int, id: Int, title: String,  completed: Bool, completion: @escaping(_ status: Bool, _ message: String?) -> Void) {
        provider.request(.updateTodo(userId: userId, id: id, title: title, completed: completed)) { (result) in
            switch result {
            case .success(_):
                completion(true, nil)
            case let .failure(error):
                completion(false, error.localizedDescription)
            }
        }
    }
    
}
