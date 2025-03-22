package cjHomework2

import std.io.*
import std.console.*
import std.convert.*
import std.collection.*

var args = ArrayList<String>()
var i = 0

func readParam(end!: Bool = false): String {
    let arg = args[i]
    i += 1
    if (end) {
        i = 0
    }
    return arg
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
            Category.CheckingAccount
        } else {
            Category.SavingsAccount
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
        i = 0
        args = ArrayList<String>()
        var input = Console.stdIn.readln()
        if (input.isNone()) {
            continue
        }
        var line = input.getOrThrow()
        // 删掉注释
        if (line.contains("#")) {
            line = line.split("#")[0]
            line = line.trimAscii()
        }
        let parts = line.split(' ')
        if (parts.isEmpty()) {
            continue
        }
        let action = parts[0]
        args = ArrayList(parts[1..])

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
