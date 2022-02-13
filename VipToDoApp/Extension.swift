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

extension String{
    func stringToDate(strDate: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        guard let date = dateFormatter.date(from: strDate) else {return Date()}
        return date
    }
}
