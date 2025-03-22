package cjHomework2

import std.io.*
import std.console.*
import std.convert.*

func readParam(end!: Bool = false): String {
    let char = if (end) {
        r'\n'
    } else {
        r' '
    }
    Console.stdIn.readUntil(char).getOrThrow().trimRight(" ")
}

func readMoneyParam(end!: Bool = false): Int64 {
    Int64(Float64.tryParse(readParam()).getOrThrow() * 100.0)
}

main(): Unit {
    let bank = Bank()
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
        bank.deposite(account, amount)
    }
    func withdraw(): Unit {
        let account = readParam()
        let amount = readMoneyParam(end: true)
        bank.withdraw(account, amount)
    }
    func info(): Unit {
        let account = readParam(end: true)
        println("Unimplemented")
    }

    while (true) {
        let action = Console.stdIn.readUntil(r' ').getOrThrow().trimRight(" ")
        println(action)
        match (action) {
            case "create" => create()
            case "deposit" => deposit()
            case "withdraw" => withdraw()
            case "info" => info()
            case "Exit" => break
            case _ => println("Invalid command")
        }
    }
}
