//
//  Deposit.swift
//  Bank
//
//  Created by Даниил Апальков on 04.12.2020.
//

import Foundation

class DepositAccount: IAccount {
    internal var dayCount: Int = 0
    private(set) var validalityOfTheCard: Int = 1460
    private(set) var persent: Double
    private(set) var commission: Double = 0
    internal var amount: Double
    private(set) var canGetToMinusMoney: Bool = false
    private(set) var canWithdrawMoney: Bool = false
    private(set) var canTransferMoney: Bool = false
    internal var isQuestionable: Bool = false
    private(set) var accountNumber: String = UUID().uuidString
    
    init(amount: Double) {
        self.amount = amount
        if amount < 50000 {
            self.persent = 3
        } else if amount < 100000 {
            self.persent = 3.5
        } else {
            self.persent = 4
        }
    }
    
    func closeDay() -> Int {
        self.dayCount += 1
        if self.dayCount == self.validalityOfTheCard {
            self.canWithdrawMoney = true
            self.canTransferMoney = true
        }
        return dayCount
    }
}
