//
//  DateToFormattedString.swift
//  VipToDoApp
//
//  Created by Bilal on 11.02.2022.
//

import Foundation

extension Date{
    func dateToString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let date = dateFormatter.string(from: date)
        return date
    }
}
