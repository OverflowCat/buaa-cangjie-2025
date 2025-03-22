func isLeapYear(year: Int64) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
}


main() {
    let PI = 3.1415926
    let r: Float64 = 1.0
    let 周长 = 2.0 * r * PI
    print(周长)

    isLeapYear(2024)
    return
}
