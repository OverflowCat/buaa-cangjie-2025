package cjHomework2

import std.collection.*

class History {
    // （按时间先后）打印银行最近5条交易历史：history，输出格式为交易类型
    // （仅包括deposit，withdraw和transfer）+金额，如“transfer 100.00”。
    // 若不满五条则全部输出，不同历史之间使用换行符分隔
    private var ops = ArrayList<(String, Int64)>()

    func print(): Unit {
        // println("We have " + ops.size.toString()) // 只 create 的话没有输出
        for ((op, num) in ops |> take(5)) {
            op + " " + (num |> money2s) |> println
        }
    }

    func add(op: String, num: Int64): Unit {
        ops.prepend((op, num))
    }
}
