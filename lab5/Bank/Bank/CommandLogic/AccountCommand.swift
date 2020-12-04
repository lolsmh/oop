import Foundation

class AccountCommand {
    var account: IAccount
    var amount: Double
    
    init(account: IAccount, amount: Double) {
        self.account = account
        self.amount = amount
    }
    
    func execute() throws {
        throw CommandException.isNotImplemented()
    }
    
    func undo() throws {
        throw CommandException.isNotImplemented()
    }
}
