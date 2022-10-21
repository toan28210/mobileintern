import UIKit

//lesson1
func sumTriple(firstNumber: Int, secondNumber: Int) -> Int {
    let sum = firstNumber + secondNumber
    return firstNumber == secondNumber ? sum * 3 : sum
}

let sum = sumTriple(firstNumber: 4, secondNumber: 5)
//lesson 2
func absoluteDiff(num: Int) -> Int {
    return num > 51 ? (num - 51) * 2 : 51 - num
}
let absolute = absoluteDiff(num: 52)
//lesson 3
func isTwenty(firstNumber: Int, secondNumber: Int) -> Bool {
    let sum = firstNumber + secondNumber
    if firstNumber == 20 || secondNumber == 20 || sum == 20 {
        return true
    }
    return false
}
let value = isTwenty(firstNumber: 10, secondNumber: 10)
//lesson 4
func isNegativeOrPositive(firstNumber: Int, secondNumber: Int) -> Bool {
    if firstNumber * secondNumber < 0 {
        return true
    } else if firstNumber < 0 && secondNumber < 0 {
        return true
    }
    return false
}

print(isNegativeOrPositive(firstNumber: 0, secondNumber: 5))

//lesson 5
func addIs(str: String) -> String {
    var newString = str
    if !str.hasPrefix("Is") {
        newString = "Is\(str)"
    }
    return newString
}
let addIsNewString = addIs(str: "")

//lesson 6
func removeCharater(index: Int, str: String) -> String?
{
    if str.isEmpty {
        return nil
    }
    if index > str.count {
        return nil
    }
    let count = str.count
    var newString = str
    let index = str.index(str.startIndex, offsetBy: index - 1)
    if count > 0 {
        newString.remove(at: index)
    }
    return newString
}

let newString = removeCharater(index: 2, str: "Hello")

//lesson 7
func changeCh(_ str: String) -> String? {
    if str.isEmpty {
        print("")
        return nil
    }
    var newString = str
    let firstCharacter = str.prefix(1)
    let lastCharacter = str.suffix(1)
    
    newString.removeFirst()
    newString.removeLast()
    return lastCharacter + newString + firstCharacter
}

print(changeCh("Hello"))
//lesson 8
func addTheLastCh(_ str: String) -> String? {
    if str.count < 1 {
        return nil
    }
    let lastCharacter = String(str.suffix(1))
    return lastCharacter + str + lastCharacter
}

print(addTheLastCh("Hello")!)
// lesson 9
func multipleOfThreeOrFive(number: Int) {
    if number < 0 {
        print("number must be a positive integer")
    }
    if number % 5 == 0 && number % 3 == 0 {
        print("\(number) is a multiple of 3 and multiple of 5")
    } else if number % 5 == 0 && number % 3 != 0 {
        print("\(number) is a multiple of 5")
    } else if number % 5 == 0 && number % 3 != 0 {
        print("\(number) is a multiple of 3")
    } else {
        print("\(number) is not a multiple of 3 and 5")
    }
}

multipleOfThreeOrFive(number: 0)
//lesson 10
let str = "Hello"
func addTwoCharacters(str: String) -> String? {
    if str.count < 2 {
        print("The length of the string must be more than 2 characters")
        return nil
    }
    let twoFirst = str.prefix(2)
    return twoFirst + str + twoFirst
}
let b = addTwoCharacters(str: str)








