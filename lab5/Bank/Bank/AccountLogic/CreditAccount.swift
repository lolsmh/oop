//
//  CreditAccount.swift
//  Bank
//
//  Created by Даниил Апальков on 04.12.2020.
//

import Foundation

class CreditAccount: IAccount {
    private(set) var commission: Double = 0
    internal var dayCount: Int = 0
    private(set) var validalityOfTheCard: Int = 1460
    private(set) var persent: Double = 0
    private(set) var fixedCommision: Double
    private(set) var canGetToMinusMoney: Bool = true
    private(set) var canWithdrawMoney: Bool = true
    private(set) var canTransferMoney: Bool = true
    internal var isQuestionable: Bool = false
    private(set) var accountNumber: String = UUID().uuidString
    internal var amount: Double = 0 {
        didSet {
            if amount < 0 {
                commission = fixedCommision
            }
        }
    }
    
    init(commision: Double, amount: Double) {
        self.fixedCommision = commision
        self.amount = amount
    }
}
