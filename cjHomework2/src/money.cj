package cjHomework2

import std.format.*

func money2f(num: Int64): Float64 {
    return Float64(num) / 100.0
}

func money2s(num: Int64): String {
    return (num |> money2f).format(".2")
}

func f2money(num: Float64): Int64 {
    return Int64(num * 100.0)
}
