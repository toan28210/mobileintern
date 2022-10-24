import UIKit

protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")


//Methob Requirements

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("\(generator.random())")

//mutating method Requirements
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()



//extension
protocol Caculater {
    func show()
    func add(a: Int, b: Int) -> Int
}

class addNumber {
    var a: Int
    var b: Int
    var result: Int = 0
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
}

extension addNumber: Caculater {
    func show() {
        print("result \(result)")
    }
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
}

var addTwoNumber = addNumber(a: 4, b: 5)
addTwoNumber.show()
addTwoNumber.add(a: 4, b: 7)

//
class Animal {
    
}

protocol CanMakeSound {
    func sound()
}

protocol CanEat {
    var foodType: String { get }
    func eat(foodType: String) -> String
    init(foodType: String)
}

class Dog: Animal, CanMakeSound, CanEat {
    var foodType: String = "Meat"
    
    required init(foodType: String) {
        self.foodType = foodType
    }
    
    func sound() {
        print("gau gau")
    }
    
    func eat(foodType: String) -> String {
        return foodType
    }
    
}

var myDog = Dog(foodType: "Meat")
myDog.sound()
class cat: Animal, CanMakeSound {
    func sound() {
        print("meomeo")
    }
}

