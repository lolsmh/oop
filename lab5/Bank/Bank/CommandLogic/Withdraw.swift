//
//  Withdraw.swift
//  Bank
//
//  Created by Даниил Апальков on 03.12.2020.
//

import Foundation

class Withdraw : AccountCommand {
    override func execute() {
        self.account.amount -= self.amount
    }
    override func undo() {
        Income(account: account, amount: amount).execute()
    }
}
