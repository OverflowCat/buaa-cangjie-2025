package cjHomework1

import std.collection.*

main(): Int64 {
    let n = 5
    var lastLine = ArrayList<UInt32>()
    lastLine.append(1)
    println(lastLine)
    var i = 0
    while (i < n) {
        let thisLine = ArrayList<UInt32>()
        thisLine.append(1)
        // let lastLine = lastLine.clone()
        // lastLine.prepend(1)
        // lastLine.append(1)
        for (i in 0..lastLine.size - 1) {
            thisLine.append(lastLine[i] + lastLine[i + 1])
        }
        thisLine.append(1)
        i += 1
        println(thisLine)
        lastLine = thisLine
    }
    return 0
}
