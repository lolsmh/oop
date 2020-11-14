//
//  MyData.swift
//  Backup
//
//  Created by Даниил Апальков on 03.11.2020.
//
import Foundation

class MyDate {
    static func now() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yy"
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "\(format.string(from: date))_\(hour):\(minutes)"
    }
}
