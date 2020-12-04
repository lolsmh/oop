//
//  BankException.swift
//  Bank
//
//  Created by Даниил Апальков on 04.12.2020.
//

import Foundation

enum BankException: Error {
    case accountDoesNotExists(message: String = "ERROR: Account doesn't exist in this bank yet. Please, use addClient to create an account")
    case accountAllreadyExists(message: String = "ERROR: Account allready exists in the bank system")
    case wrongClientInformation(message: String = "ERROR: Client information needs to have at least name and surname fields")
    case withdrawingFromQuestinoableAccount(massage: String = "ERROR: You can't fully withdraw money from your account until you fill the information")
    case transferingFromQuestinoableAccount(massage: String = "ERROR: You can't fully transfer money from your account until you fill the information")
    case numberOfUndoOperationIsTooBig(massage: String = "ERROR: The operation stack for this account is less than the number of operations you tried to undo")
    case cantGoToMinusMoney(massage: String = "ERROR: You can't go to minus money in your account")
    case cantWithdrawMoney(massage: String = "ERROR: You can't withdraw money in your account")
    case cantTransferMoney(massage: String = "ERROR: You can't transfer money in your account")
    case notEnoughInformation(massage: String = "ERROR: You should be shure that your account information has both addres and passport fields")
}
