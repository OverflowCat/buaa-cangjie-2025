package cjHomework1

import std.collection.*
import std.console.*
import std.convert.*
import std.core.*

main(): Int64 {
    let str = Console.stdIn.readln().getOrThrow()
    let n = Int64.tryParse(str).getOrThrow()
    var lastLine = ArrayList<UInt32>()
    lastLine.append(1)
    println(lastLine[0])
    var i = 0
    while (i < n) {
        let thisLine = ArrayList<UInt32>()
        thisLine.append(1)
        for (i in 0..lastLine.size - 1) {
            thisLine.append(lastLine[i] + lastLine[i + 1])
        }
        thisLine.append(1)
        i += 1
        for (num in thisLine) {
            print(num)
            print("")
        }
        println("")
        lastLine = thisLine
    }
    return 0
}
