import Foundation

var clients = try ClientReader.fromFile("/Users/sugardaddy/Desktop/OOP_2020/lab5/Bank/Bank/ClientLogic/File.txt")

var bank = SberBank(
    commission: 0.1,
    persent: 3.65,
    maxWithdrawAmountForQuestinoableAccounts: 1000,
    maxTransferAmountForQuestinoableAccounts: 1000
)

var client = ClientInitializer()
    .setName(clients[0][0])
    .setSurname(clients[0][1])
    .setPassportNumber(clients[0][2])
    .setAddres(clients[0][3])
    .build()
var client1 = ClientInitializer()
    .setName(clients[1][0])
    .setSurname(clients[1][1])
    .build()

do {

    try bank.addClient(client: client, amount: 1000, account: AccountType.Debit)
    try bank.addClient(client: client1, amount: 1010, account: AccountType.Debit)

    try bank.IncomeBalanceOf(client: client, by: 1000)
    try bank.IncomeBalanceOf(client: client, by: 1000)
    try bank.addInformation(client: client1, address: "Home1", passport: "0000-000000")
    try bank.WithdrawBalanceOf(client: client1, by: 1010)
    try bank.IncomeBalanceOf(client: client1, by: 1000)

    try print(bank.getAmount(client: client1))
    try print(bank.getAmount(client: client))

    try bank.MakeTransfer(from: client, to: client1, amount: 1000)
    
    try print(bank.getAmount(client: client1))
    try print(bank.getAmount(client: client))
    
    try bank.undo(2, client: client)

    try print(bank.getAmount(client: client1))
    try print(bank.getAmount(client: client))
    
} catch BankException.accountDoesNotExists(let error) {
    print(error)
} catch BankException.accountAllreadyExists(let error){
    print(error)
} catch BankException.wrongClientInformation(let error){
    print(error)
} catch BankException.withdrawingFromQuestinoableAccount(let error){
    print(error)
} catch BankException.transferingFromQuestinoableAccount(let error){
    print(error)
} catch BankException.numberOfUndoOperationIsTooBig(let error){
    print(error)
} catch BankException.cantWithdrawMoney(let error) {
    print(error)
} catch BankException.cantGoToMinusMoney(let error) {
    print(error)
}
