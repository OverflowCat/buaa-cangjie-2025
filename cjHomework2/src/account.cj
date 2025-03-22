package cjHomework2

import std.collection.*

class Account {
    var balance: Int64
    let id: AccoundUuid
    let name: String
    let category: Category

    public init(category: Category, name: String, id: AccoundUuid, balance: Int64) {
        this.category = category
        this.name = name
        this.id = id
        this.balance = balance
    }

    public func deposit(amount: Int64): Unit {
        balance += amount
    }

    public func withdraw(amount: Int64): ?Int64 {
        match (category) {
            case SavingsAccount where balance - amount < 0 =>
                // throw OverflowException("Insufficient funds")
                println("Error")
                None
            case _ =>
                balance -= amount
                balance
        }
    }

    
}
