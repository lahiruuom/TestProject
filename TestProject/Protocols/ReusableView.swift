//
//  Protocols.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import Foundation
import UIKit

//MARK: ReusableView
import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension TableViewCell: ReusableView {}

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: NibLoadableView {}
extension UITableViewCell: NibLoadableView {}

//MARK: UITableView
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView{
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
