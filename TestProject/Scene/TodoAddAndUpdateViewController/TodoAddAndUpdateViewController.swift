//
//  TodoAddAndUpdateViewController.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import UIKit

class TodoAddAndUpdateViewController: UIViewController {
    
    var viewModel: TodoAddAndUpdateViewModel? = nil
    
    // MARK: IBOutlets
    @IBOutlet weak var confirmContainerview: UIView!
    @IBOutlet weak var alphaView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    @IBOutlet weak var titleTF: UITextField!
    
    // MARK: Properties
    public class var storyboardName: String {
        return "Main"
    }
    
    static func create(viewModel: TodoAddAndUpdateViewModel) -> TodoAddAndUpdateViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: TodoAddAndUpdateViewController.self)) as? TodoAddAndUpdateViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.alphaView.alpha = self.viewModel!.visibleAlpha
        }
    }
    
    // MARK: IBActions
    @IBAction func submitPressed(_ sender: UIButton) {
        if titleTF.text!.isEmpty {
            return
        }
        switch viewModel!.editViewType {
        case .add:
            createTodo(userId: 1, id: Int.random(in: 0..<1000), title: titleTF.text!, completed: completedSwitch.isOn)
        case .update:
            updateTodo(userId: 1, id: Int.random(in: 0..<1000), title: titleTF.text!, completed: completedSwitch.isOn)
        }
    }
    
    @IBAction func cancelDidPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.alphaView.alpha = 0
            self.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - Fileprivate Methods
extension TodoAddAndUpdateViewController {
    
    fileprivate func setupView() {
        alphaView.alpha = 0
        switch viewModel!.editViewType {
        case .add:
            titleLabel.text = "Add Todo"
            buttonLabel.text = "SUBMIT"
        case .update:
            titleLabel.text = "Update Todo"
            buttonLabel.text = "UPDATE"
        }
        guard let todoObject  = viewModel!.todoObject else { return }
        titleTF.text = todoObject.title
        completedSwitch.setOn(todoObject.completed, animated: true)
    }
    
    fileprivate func createTodo(userId: Int, id: Int, title: String, completed: Bool) {
        viewModel!.createTodos(userId: userId, id: id, title: title, completed: completed) { (status, message) in
            if status {
                self.cancelDidPressed(self)
            } else{
                self.alert(message: message ?? "", title: "Sorry!")
            }
        }
    }
    
    fileprivate func updateTodo(userId: Int, id: Int, title: String, completed: Bool) {
        viewModel!.updateTodos(userId: userId, id: id, title: title, completed: completed) { (status, message) in
            if status {
                self.cancelDidPressed(self)
            } else{
                self.alert(message: message ?? "", title: "Sorry!")
            }
        }
    }
    
}
