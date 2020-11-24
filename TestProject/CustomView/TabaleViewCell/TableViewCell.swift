//
//  TableViewCell.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var checkBoxImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: Properties
    var isChecked: Bool = false {
        didSet {
            if isChecked {
                checkBoxImg.image = UIImage(named: "checkedBox")
            } else{
                checkBoxImg.image = UIImage(named: "uncheckedBox")
            }
        }
    }
    
    // MARK: Override Methodes
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension TableViewCell {
    
    func setupView(todoObject: TodoModel?) {
        guard let todo = todoObject else { return }
        titleLabel.text = todo.title
        isChecked = todo.completed
    }
    
}
