//
//  Date+Extension.swift
//  TestProject
//
//  Created by Lahiru Munasinghe on 11/24/20.
//

import Foundation

extension Date {
    
    func getTimeAndSymbol() -> (String,String){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "h:mm"
        let time = formatter.string(from: self)
        formatter.dateFormat = "a"
        let amOrPm = formatter.string(from: self)
        return (time,amOrPm)
    }
    
    func toMonth(format: String = "MMM") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func toDateFormat(format: String = "EEEE, ddQQQQ") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: self)
    }
    
}
