//
//  UIColor+Extensions.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import UIKit

enum AssetsColor: String {
    case lightGray
    case red
    case blue
}


extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
}

