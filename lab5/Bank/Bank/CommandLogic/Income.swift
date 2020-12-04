//
//  DepositCommand.swift
//  Bank
//
//  Created by Даниил Апальков on 03.12.2020.
//

import Foundation

class Income : AccountCommand {
    override func execute() {
        self.account.amount += self.amount
    }
    override func undo() {
        Withdraw(account: account, amount: amount).execute()
    }
}
