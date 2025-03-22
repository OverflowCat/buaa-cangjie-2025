package cjHomework2

import std.collection.*

// 定义一个抽象的基类 Account
abstract class Account {
    var balance: Int64
    let id: AccoundUuid
    let name: String

    public init(name: String, id: AccoundUuid, balance: Int64) {
        this.name = name
        this.id = id
        this.balance = balance
    }

    // 抽象方法，子类必须实现
    public func info(): Unit

    // 存款
    public func deposit(amount: Int64): Unit {
        balance += amount
    }

    public func withdraw(amount: Int64): ?Int64
}

// 储蓄账户，不可透支 
class SavingsAccount <: Account {

    // 继承的类无空参数构造函数，则必须显式调用父类构造函数
    public init(name: String, id: AccoundUuid, balance: Int64) {
        super(name, id, balance)
    }

    public func info(): Unit {
        print("saving account, id: " + id.toString() + ", owner: " + name)
        println(", balance: " + (balance |> money2s))
    }

    // 实现取款操作，不允许透支
    public func withdraw(amount: Int64): ?Int64 {
        if ((balance - amount) < 0) {
            println("Error") // Insufficient funds
            return None
        } else {
            balance -= amount
            return balance
        }
    }

}

// 支票账户，允许透支
class CheckingAccount <: Account {

    public init(name: String, id: AccoundUuid, balance: Int64) {
        super(name, id, balance)
    }

    public override func info(): Unit {
        print("checking account, id: " + id.toString() + ", owner: " + name)
        println(", balance: " + (balance |> money2s))
    }

    public override func withdraw(amount: Int64): ?Int64 {
        balance -= amount
        return balance
    }

}
