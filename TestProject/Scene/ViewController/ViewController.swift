//
//  ViewController.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//
import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel?
    
    // MARK: Properties
    public class var storyboardName: String {
        return "Main"
    }
    
    static func create(viewModel: ViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
        viewController!.viewModel = viewModel
        return viewController!
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var dateDescLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var floatingButttonContainer: UIView!
    @IBOutlet weak var tabelView: UITableView!
    
    // MARK: Override Methodes
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTodos()
    }
    
    @IBAction func addTodoDidPressed(_ sender: UIButton) {
        let vc = TodoAddAndUpdateViewController.create(viewModel: TodoAddAndUpdateViewModel(editViewType: .add, todoObject: nil))
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
}

// MARK: - Fileprivate Methods
extension ViewController {
    
    fileprivate func setupView() {
        floatingButttonContainer.layer.cornerRadius = floatingButttonContainer.frame.height / 2
        dateDescLabel.text = Date().toDateFormat()
        monthLabel.text = Date().toMonth()
        tabelView.register(TableViewCell.self)
    }
    
    fileprivate func getTodos() {
        viewModel!.fetchTodos { (status, message) in
            if status {
                self.setNumberOfTask()
                self.tabelView.reloadData()
            } else{
                self.alert(message: message ?? "", title: "Sorry!")
            }
        }
    }
    
    fileprivate func setNumberOfTask() {
        taskLabel.text = "\(viewModel!.todoArray.count) Tasks"
    }
    
    fileprivate func deleteTodo(id: Int) {
        viewModel!.deleteTodos(id: id) { (status, message) in
            if status {
                self.tabelView.reloadData()
            } else{
                self.alert(message: message ?? "", title: "Sorry!")
            }
        }
    }
    
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as! TableViewCell
        let object = self.viewModel!.todoArray[indexPath.row]
        cell.setupView(todoObject: object)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel!.tableViewHeight)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let object = self.viewModel!.todoArray[indexPath.row]
        if editingStyle == .delete {
            viewModel!.todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            deleteTodo(id: object.id)
            setNumberOfTask()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = self.viewModel!.todoArray[indexPath.row]
        let vc = TodoAddAndUpdateViewController.create(viewModel: TodoAddAndUpdateViewModel(editViewType: .update, todoObject: object))
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
}
