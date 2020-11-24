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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
