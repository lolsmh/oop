import Foundation

class Transfer : AccountCommand {
    var commission: Double = 0
    var toAccount: IAccount?
    
    init(from: IAccount, to: IAccount, amount: Double, comission: Double) {
        super.init(account: from, amount: amount)
        self.commission = comission
        self.toAccount = to
    }
    
    override func execute() {
        Withdraw(account: account, amount: amount * commission).execute()
        Income(account: toAccount!, amount: amount).execute()
    }
    override func undo() {
        Income(account: account, amount: amount * commission).execute()
        Withdraw(account: toAccount!, amount: amount).execute()
    }
}
