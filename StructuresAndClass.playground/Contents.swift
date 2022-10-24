import UIKit
import Foundation

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//intances
let someResolution = Resolution()
let someVideoMode = VideoMode()

//Accessing Ptoperties
print("The width of someResolution is \(someResolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// initializers struct types

let vga = Resolution(width: 640, height: 480)

//Classes are Reference Types
let hd = Resolution(width: 1920, height: 1080)
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

struct Temperature {
  var celsius: Double
  init(celsius: Double) {
    self.celsius = celsius
  }
  init(fahrenheit: Double) {
    celsius = (fahrenheit - 32) / 1.8
  }
  init(kelvin: Double) {
    celsius = kelvin - 273.15
  }
  init() {
    celsius = 0
  }
}
extension Temperature {
    func handle() {
        print("here")
    }
}
let currentTemperature = Temperature(celsius: 18.5)
let boiling = Temperature(fahrenheit: 212.0)
let absoluteZero = Temperature(kelvin: 0.0)
let freezing = Temperature()
print(currentTemperature.celsius)
print(boiling.celsius)
print(absoluteZero.celsius)
print(freezing.celsius)
print(freezing.handle())

class Person {
    var weight = 0.0
    var height = 0.0
    func walk() {
        print("")
    }
}

//	kieu tham tri(Value type) Struct
struct Student {
    var name: String
    var phone: Int
    var address: String
}

let studen_a = Student(name: "A", phone: 092834312, address: "DANANG")
var studen_b = studen_a

studen_b.name = "B"

print(studen_a)
print(studen_b)

//Class kieu tham chieu(Reference Type)


class StudentVKU {
    var name: String = ""
    var phone: Int
    var address: String
    init(name: String, phone: Int, address: String) {
        self.name = name
        self.phone = phone
        self.address = address
    }
}

var studentA = StudentVKU(name: "A", phone: 0938653823, address: "DN")
var studentB = studentA
studentB.name = "B"

print(studentB.name)
print(studentA.name)

//Class co tinh ke thua

class Bird {
    var speed = 0.0
    func fly() {
        print("Fly speed \(speed)")
    }
}

class Eagle: Bird {
    var name: String = "eagle"
}

let eagle = Eagle()
eagle.speed = 75
print(eagle.fly())

//Thay doi

struct Rectangle {
    var width = 1
    var height = 1
    func area() -> Int {
        return width * height
    }
    mutating func scaleBy(value: Int) {
        width *= value
        height *= value
    }
}

var myRect = Rectangle(width: 3, height: 3)
myRect.scaleBy(value: 3)
myRect.area()

class OtherRectangle {
    var width = 1
    var height = 1
    
    func area() -> Int {
        return width * height
    }
    
    func scaleBy(value: Int) {
        width *= value
        height *= value
    }
}
let otherMyRect = OtherRectangle()
otherMyRect.scaleBy(value: 3)
otherMyRect.area()


//deinit
class Car {
    let name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinit")
    }
}
var car:Car?
car = Car(name: "BMW")
car = nil

//Type casting
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

//Implement protocol
protocol FullyNamed {
    var fullName: String { get }
}

struct StructPerson: FullyNamed {
    var fullName: String
}
let jason = StructPerson(fullName: "Jason")

class OtherPerson: FullyNamed {
    var fullName: String
    init(fullName: String) {
        self.fullName = fullName
    }
}

let anna = OtherPerson(fullName: "Anna")
