//
//  SberBank.swift
//  Bank
//
//  Created by Даниил Апальков on 04.12.2020.
//

import Foundation

class SberBank: IBank {
    private(set) var maxWithdrawAmountForQuestinoableAccounts: Double
    private(set) var maxTransferAmountForQuestinoableAccounts: Double
    private(set) var commission: Double
    private(set) var persent: Double
    var clientInfo: [Client : Triplet<IAccount, [AccountCommand], Double>] = [:]
    
    init(commission: Double, persent: Double, maxWithdrawAmountForQuestinoableAccounts: Double, maxTransferAmountForQuestinoableAccounts: Double) {
        self.commission = commission
        self.persent = persent
        self.maxTransferAmountForQuestinoableAccounts = maxTransferAmountForQuestinoableAccounts
        self.maxWithdrawAmountForQuestinoableAccounts = maxWithdrawAmountForQuestinoableAccounts
    }
}

