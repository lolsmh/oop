//
//  IAccount.swift
//  Bank
//
//  Created by Даниил Апальков on 03.12.2020.
//

import Foundation

protocol IAccount {
    var dayCount: Int {get set}
    var validalityOfTheCard: Int {get}
    var persent: Double {get}
    var commission: Double {get}
    var amount: Double {get set}
    var canGetToMinusMoney: Bool {get}
    var canWithdrawMoney: Bool {get}
    var canTransferMoney: Bool {get}
    var isQuestionable: Bool {get set}
    var accountNumber: String {get}
    mutating func setAsQuestionable() -> IAccount
    mutating func unsetAsQuestionable() -> IAccount
    mutating func closeDay() -> Int
}

extension IAccount {
    mutating func setAsQuestionable() -> IAccount {
        self.isQuestionable = true
        return self
    }
    
    mutating func unsetAsQuestionable() -> IAccount {
        self.isQuestionable = false
        return self
    }
    
    mutating func closeDay() -> Int {
        self.dayCount += 1
        return dayCount
    }
}
