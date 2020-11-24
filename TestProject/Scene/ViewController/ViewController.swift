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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
