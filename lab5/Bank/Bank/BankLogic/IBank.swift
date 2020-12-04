import Foundation

protocol IBank {
    var persent: Double {get}
    var commission: Double {get}
    var maxWithdrawAmountForQuestinoableAccounts: Double {get}
    var maxTransferAmountForQuestinoableAccounts: Double {get}
    var clientInfo: [Client : Triplet<IAccount, [AccountCommand], Double>] {get set}
    
    mutating func addClient(client: Client, amount: Double, account: AccountType) throws
    mutating func WithdrawBalanceOf(client: Client, by amount: Double) throws
    mutating func IncomeBalanceOf(client: Client, by amount: Double) throws
    mutating func MakeTransfer(from: Client, to: Client, amount: Double) throws
    mutating func undo(_ number: Int, client: Client) throws
    mutating func addInformation(client: Client, address: String?, passport: String?) throws
    func closeDay()
    func closeFewDays(_ number: Int)
    func getAmount(client: Client) throws -> Double
}

extension IBank {
    private var persent: Double {
        return self.persent
    }
    
    private var commission: Double {
        return self.commission
    }
    
    private var maxWithdrawAmountForQuestinoableAccounts: Double {
        return self.maxWithdrawAmountForQuestinoableAccounts
    }
    
    private var maxTransferAmountForQuestinoableAccounts: Double {
        return self.maxTransferAmountForQuestinoableAccounts
    }
    
    mutating func addClient(client: Client, amount: Double, account: AccountType) throws {
        var currentAccount: IAccount?
        
        switch account {
        case .Debit:
            currentAccount = DebitAccount(persent: self.persent, amount: amount)
        case .Credit:
            currentAccount = CreditAccount(commision: commission, amount: amount)
        case .Deposit:
            currentAccount = DepositAccount(amount: amount)
        }
        
        if clientInfo[client] == nil {
            if client.description.contains("name:") && client.description.contains("surname:") {
                if client.description.contains("address:") && client.description.contains("passport:") {
                    clientInfo[client] = Triplet(currentAccount!, [], 0)
                } else {
                    var questinoableAccount = currentAccount!
                    clientInfo[client] = Triplet(questinoableAccount.setAsQuestionable(), [], 0)
                }
            } else {
                throw BankException.wrongClientInformation()
            }
        } else {
            throw BankException.accountAllreadyExists()
        }
    }
    
    mutating func WithdrawBalanceOf(client: Client, by amount: Double) throws {
        if let info = clientInfo[client] {
            if !info.first.canWithdrawMoney {
                throw BankException.cantWithdrawMoney()
            }
            if info.first.isQuestionable {
                if amount > maxWithdrawAmountForQuestinoableAccounts {
                    throw BankException.withdrawingFromQuestinoableAccount(massage: "ERROR: You can't withdraw money from your account bigger than \(maxWithdrawAmountForQuestinoableAccounts) until you fill the information")
                }
            }
            if amount > info.first.amount {
                if !info.first.canGetToMinusMoney {
                    throw BankException.cantGoToMinusMoney()
                }
            }
            
            let command = Withdraw(account: info.first, amount: amount)
            command.execute()
            info.second.append(command)
        } else {
            throw BankException.accountDoesNotExists()
        }
    }

    mutating func IncomeBalanceOf(client: Client, by amount: Double) throws {
        if let info = clientInfo[client] {
            let command = Income(account: info.first, amount: amount)
            command.execute()
            info.second.append(command)
        } else {
            throw BankException.accountDoesNotExists()
        }
    }

    mutating func MakeTransfer(from: Client, to: Client, amount: Double) throws {
        if let fromInfo = clientInfo[from] {
            if !fromInfo.first.canTransferMoney {
                throw BankException.cantTransferMoney()
            }
            if let toInfo = clientInfo[to] {
                if fromInfo.first.isQuestionable {
                    if amount > maxTransferAmountForQuestinoableAccounts {
                        throw BankException.transferingFromQuestinoableAccount(massage: "ERROR: You can't transfer money from your account bigger than \(maxTransferAmountForQuestinoableAccounts) until you fill the information")
                    }
                } else {
                    if amount > fromInfo.first.amount {
                        if !fromInfo.first.canGetToMinusMoney {
                            throw BankException.cantGoToMinusMoney()
                        }
                    }
                }
                let command = Transfer(from: fromInfo.first, to: toInfo.first, amount: amount, comission: commission)
                command.execute()
                fromInfo.second.append(command)
            }
        } else {
            throw BankException.accountDoesNotExists()
        }
    }

    mutating func undo(_ number: Int = 1, client: Client) throws {
        if let info = clientInfo[client] {
            if info.second.count >= number {
                do {
                    for i in 0..<number {
                        try info.second[info.second.count - 1 - i].undo()
                    }
                } catch CommandException.isNotImplemented(let error) {
                    print(error)
                }
                info.second.removeLast(number)
            } else {
                throw BankException.numberOfUndoOperationIsTooBig(massage: "ERROR: The operation stack for this account is less than the \(number)")
            }
        } else {
            throw BankException.accountDoesNotExists()
        }
    }
    
    mutating func addInformation(client: Client, address: String?, passport: String?) throws {
        if clientInfo[client] != nil {
            if !client.description.hasPrefix("address:") && address != nil {
                client.description += "address: \(address!) "
            } else {
                throw BankException.notEnoughInformation()
            }
            if !client.description.hasPrefix("passport:") && passport != nil {
                client.description += "passport: \(passport!) "
            } else {
                throw BankException.notEnoughInformation()
            }
            self.clientInfo[client]!.first = self.clientInfo[client]!.first.unsetAsQuestionable()
        } else {
            throw BankException.accountDoesNotExists()
        }
    }
    
    func getAmount(client: Client) throws -> Double {
        if let info = clientInfo[client] {
            return info.first.amount
        } else {
            throw BankException.accountDoesNotExists()
        }
    }
    
    func closeDay() {
        for (_, value) in self.clientInfo {
            var currentClient = value.first
            let day = currentClient.closeDay()
            if day % 30 == 0 {
                value.third += currentClient.amount * (persent / 36500)
            } else {
                currentClient.amount += value.third
                value.third = 0
            }
        }
    }
    
    func closeFewDays(_ number: Int) {
        for _ in 0..<number {
            closeDay()
        }
    }
}
