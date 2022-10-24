import UIKit

let simpleClosure = {
    print("Hello Closure")
}

simpleClosure()

let closure = { () -> Void in
    
}

let hiClosure = { (name: String) in
    print("Hi, \(name)")
}
hiClosure("Closure")

let addClosure = { (a: Int, b: Int) -> (Int) in
    return a + b
}

print(addClosure(3, 2))

let closureInClosure = { (name: String) in
    simpleClosure()
    print("I am \(name)")
}

closureInClosure("closure")

var add: (Int, Int) -> (Int)

add = { (a: Int, b: Int) -> (Int) in
    return a + b
}
print("1 + 1 = \(add(1,1))")

add = { (a: Int, b: Int) -> (Int) in
    return a + 2 * b
}
print("1 + 1 = \(add(1,1))")

//Tralling Protocaol

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

