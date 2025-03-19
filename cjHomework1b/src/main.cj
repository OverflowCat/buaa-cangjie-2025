package cjHomework1b
import std.console.*
import std.convert.*

main(): Int64 {
    println("请输入数字：")
    let str = Console.stdIn.readln().getOrThrow()
    let n = UInt32.tryParse(str).getOrThrow()
    let res = 质因数(n)
    println(res)
    let tup: (UInt32, UInt32) = (111, 222)
    println(tup[0])
    return 0
}


func 质因数(n: UInt32): UInt32 {
    var v = n
    var sum = 0u32
    if (n < 2) {
        return 0
    }
    var i = 2u32
    while (i * i <= v) {
        while (v % i == 0) {
            sum += i
            v /= i
        }
        i++
    }
    if (n > i) {
        sum + i
    } else {
        sum
    }
}
