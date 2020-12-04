//
//  DebitAccount.swift
//  Bank
//
//  Created by Даниил Апальков on 04.12.2020.
//

import Foundation

class DebitAccount: IAccount {
    internal var dayCount: Int = 0
    private(set) var validalityOfTheCard: Int = 1460
    private(set) var persent: Double
    private(set) var commission: Double = 0
    internal var amount: Double = 0
    private(set) var canGetToMinusMoney: Bool = false
    private(set) var canWithdrawMoney: Bool = true
    private(set) var canTransferMoney: Bool = true
    internal var isQuestionable: Bool = false
    private(set) var accountNumber: String = UUID().uuidString
    
    init(persent: Double, amount: Double) {
        self.persent = persent
        self.amount = amount
    }
}
