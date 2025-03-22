package cjHomework2

import std.collection.*

type AccoundUuid = String

class Bank {
    let accounts = TreeMap<AccoundUuid, Account>()

    public init() {
    }

    public func get(account: AccoundUuid): Option<Account> {
        accounts.get(account)
    }

    public func open(category: Category, name: String, id: AccoundUuid, balance: Int64): Unit {
        if (accounts.contains(id)) {
            println("Error")
            return
        }
        let account = match (category) {
            case SavingsAccount => SavingsAccount(name, id, balance)
            case CheckingAccount => CheckingAccount(name, id, balance)
        }
        accounts.put(id, account)
    }

    public func xfer(from: AccoundUuid, to: AccoundUuid, amount: Int64): Unit {
        let fromAccount = accounts.get(from)
        let toAccount = accounts.get(to)
        match ((fromAccount, toAccount)) {
            case (Some(fromAccount), Some(toAccount)) =>
                if (let Some(result) <- fromAccount.withdraw(amount)) {
                    toAccount.deposit(amount)
                }
            case _ => println("Error")
        }
    }

    public func deposite(account: AccoundUuid, amount: Int64): Unit {
        if (let Some(account) <- accounts.get(account)) {
            account.deposit(amount)
        } else {
            println("Error")
        }
    }

    public func withdraw(account: AccoundUuid, amount: Int64): Unit {
        if (let Some(account) <- accounts.get(account)) {
            account.withdraw(amount)
        } else {
            println("Error")
        }
    }
}
