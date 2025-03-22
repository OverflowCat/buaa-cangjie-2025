package cjHomework2

import std.io.*
import std.console.*
import std.convert.*

func readParam(end!: Bool = false): String {
    let s = if (end) {
        Console.stdIn.readln()
    } else {
        Console.stdIn.readUntil(r' ')
    }
    // println("Got param: " + s.getOrThrow())
    s.getOrThrow().trimAsciiRight()
}

func readMoneyParam(end!: Bool = false): Int64 {
    Float64.tryParse(readParam(end: end)).getOrThrow() |> f2money
}

main(): Unit {
    let bank = Bank()
    let h = History()
    let history = h.print
    func create(): Unit {
        let category = if (readMoneyParam() == 1) {
            Category.SavingsAccount
        } else {
            Category.CheckingAccount
        }
        let name = readParam()
        let account = readParam()
        let balance = readMoneyParam(end: true)
        bank.open(category, name, account, balance)
    }
    func deposit(): Unit {
        let account = readParam()
        let amount = readMoneyParam(end: true)
        h.add("deposit", amount)
        bank.deposite(account, amount)
    }
    func withdraw(): Unit {
        let account = readParam()
        let amount = readMoneyParam(end: true)
        h.add("withdraw", amount)
        bank.withdraw(account, amount)
    }
    func transfer(): Unit {
        let from = readParam()
        let to = readParam()
        let amount = readMoneyParam(end: true)
        h.add("transfer", amount)
        bank.xfer(from, to, amount)
    }
    func info(): Unit {
        let account = readParam(end: true) |> bank.get
        match (account) {
            case Some(a) => a.info()
            case None => println("Error")
        }
    }

    while (true) {
        let action = Console.stdIn.readUntil(r' ').getOrThrow().trimRight(" ")
        // println("action: " + action)
        match (action) {
            case "create" => create()
            case "deposit" => deposit()
            case "withdraw" => withdraw()
            case "transfer" => transfer()
            case "info" => info()
            case "history" => history()
            case "Exit" => break
            case _ =>
                println("Invalid command")
                return
        }
    }
}
