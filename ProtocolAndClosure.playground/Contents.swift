import UIKit

// delegate and datasource
struct FoodItem {
    var name: String
}
protocol MenuSelectedItemDelegate: AnyObject {
    func selectItem(with model: FoodItem)
}
protocol MenuSelectedItemDataSourses: AnyObject {
    func numberOfMenuItem() -> Int
    func item(for position: Int) -> FoodItem
}

class SelectItem {
    func view() {
        let menuSelect = MenuSelect()
        menuSelect.delegate = self
        menuSelect.datasource = self
    }
}

extension SelectItem: MenuSelectedItemDelegate {
    func selectItem(with model: FoodItem) {
    }
}
extension SelectItem: MenuSelectedItemDataSourses {
    func numberOfMenuItem() -> Int {
        return 1
    }
    
    func item(for position: Int) -> FoodItem {
        return FoodItem(name: "Chicken")
    }
    
    
}


class MenuSelect {
    weak var delegate: MenuSelectedItemDelegate?
    weak var datasource: MenuSelectedItemDataSourses?
    func doSomething() {
        if let delegate = delegate {
            delegate.selectItem(with: FoodItem(name: "Milk"))
        }
    }
    func setupMenuView() {
        let numberItem = datasource?.numberOfMenuItem() ?? 0
    }
    
    
}



//protocol

protocol AddNumber {
    func add(a: Int, b: Int)-> Int
}

class Add: AddNumber {
    //closure
    var addN = { (a: Int, b: Int) -> Int in
        return a + b
    }
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
}

let addTwoN = Add()
addTwoN.add(a: 4, b: 4)
addTwoN.addN(4,4)

//Swapfirstlast
protocol SwapFirstLastCharactor {
    func changCh(_ str: String) -> String
    func addTheLastCh(_ str: String) -> String
}

class Swap: SwapFirstLastCharactor {
    func addTheLastCh(_ str: String) -> String {
        if str.count < 1 {
            return ""
        }
        let lastCharacter = String(str.suffix(1))
        return lastCharacter + str + lastCharacter
    }
    
    func changCh(_ str: String) -> String {
        guard !str.isEmpty else {
            return ""
        }
        var newString = str
        let firstCh = newString.prefix(1)
        let lastCh = newString.suffix(1)
        
        //remove
        newString.removeFirst()
        newString.removeLast()
        
        return lastCh + newString + firstCh
    }
}

let swap = Swap()
swap.changCh("Last")

var addTheLastCh = { (str: String) -> String in
    if str.count < 1 {
        return ""
    }
    let lastCharacter = String(str.suffix(1))
    return lastCharacter + str + lastCharacter
}
addTheLastCh("Hello")
var chanCh = { (str: String) -> String in
    guard !str.isEmpty else {
        return ""
    }
    var newString = str
    let firstCh = newString.prefix(1)
    let lastCh = newString.suffix(1)
    
    //remove
    newString.removeFirst()
    newString.removeLast()
    
    return lastCh + newString + firstCh
}

chanCh("Annabel")

protocol AddOperatorDelegate: AnyObject {
    func calculate(first: Int, second: Int, result: Int)
}
protocol AddOperatorDataSource: AnyObject {
    func getFirstNumber() -> Int
    func getSecondNumber() -> Int
}

class Calculator {
    weak var delegate: AddOperatorDelegate?
    weak var datasource: AddOperatorDataSource?
    typealias AddOperatorCompletion = (Int, Int, Int) -> Void
    typealias FirstNumber = () -> Int
    typealias SecondNumber = () -> Int
    
    func addClosure(firstNumber: FirstNumber, secondNumber: SecondNumber, completion: @escaping AddOperatorCompletion) {
        let first = firstNumber()
        let second = secondNumber()
        let result = first + second
        completion(first, second, result)
    }
    
    func add() -> Void {
        guard let datasource = datasource else {
            return
        }
        
        let first = datasource.getFirstNumber()
        let second = datasource.getSecondNumber()
        
        let result = first + second
        
        if let delegate = delegate {
            delegate.calculate(first: first, second: second, result: result)
        }
    }
}


class MyCalculator {
    var firstNumber: Int
    var secondNumber: Int
    init(firstNumber: Int, secondNumber: Int){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    func handle() {
        let calculator = Calculator()
        calculator.delegate = self
        calculator.datasource = self
        calculator.add()
        calculator.addClosure {
            return firstNumber
        } secondNumber: {
            return secondNumber
        } completion: { first, second, result in
            print("\(first) + \(second) = \(result)")
        }

    }
}

extension MyCalculator: AddOperatorDelegate, AddOperatorDataSource {
    func calculate(first: Int, second: Int, result: Int) {
        print(result)
    }
    
    func getFirstNumber() -> Int {
        return firstNumber
    }
    
    func getSecondNumber() -> Int {
        return secondNumber
    }
}

let myClass = MyCalculator(firstNumber: 4, secondNumber: 5)
myClass.handle()

//-----------------

protocol SwapFirstLastCharactorDelegate: AnyObject {
    func changCh(_ str: String, value: String)
    func addTheLastCh(_ str: String, value: String)
}

protocol SwapFirstLastCharactorDataSource: AnyObject {
    func getString() -> String
}

class MySwap {
    weak var delegate: SwapFirstLastCharactorDelegate?
    weak var datasource: SwapFirstLastCharactorDataSource?
    
    typealias SwapFirstLastCharactorCompletion = (String, String) -> Void
    typealias GetString = () -> String
    
    func swapChangChClosure(str: GetString, completion: @escaping SwapFirstLastCharactorCompletion) {
        let str = str()
        var newString = str
        let firstCh = String(newString.prefix(1))
        let lastCh = String(newString.suffix(1))
        
        //remove
        newString.removeFirst()
        newString.removeLast()
        let result = lastCh + newString + firstCh
        completion(str, result)
    }
    func addLastCharactorClosure(str: GetString, completion: @escaping SwapFirstLastCharactorCompletion) {
        let str = str()
        
        let lastCharacter = String(str.suffix(1))
        let result = lastCharacter + str + lastCharacter
        
        completion(str, result)
    }
    
    func getStringData() -> String {
        guard let datasource = datasource else {
            return ""
        }
        return datasource.getString()
    }
    
    func swapChangeCh() -> Void {
        let str = getStringData()
        guard !str.isEmpty else {
            return
        }
        var newString = str
        let firstCh = String(newString.prefix(1))
        let lastCh = String(newString.suffix(1))
        
        //remove
        newString.removeFirst()
        newString.removeLast()
        let result = lastCh + newString + firstCh
        if let delegate = delegate {
            delegate.changCh(str, value: result)
        }
    }
    
    func addLastCharactor() -> Void {
        let str = getStringData()
        if str.count < 1 {
            return
        }
        let lastCharacter = String(str.suffix(1))
        let result = lastCharacter + str + lastCharacter
        if let delegate = delegate {
            delegate.addTheLastCh(str, value: result)
        }
    }
}

class MyClassSwap {
    var str: String
    init(str: String) {
        self.str = str
    }
    
    func handle() {
        let swap = MySwap()
        swap.delegate = self
        swap.datasource = self
        swap.addLastCharactor()
        swap.swapChangeCh()
        swap.addLastCharactorClosure {
            return str
        } completion: { str, value in
            print("Closure: \(value)")
        }
        swap.swapChangChClosure {
            return str
        } completion: { str, value in
            print("Closure: \(value)")
        }


    }
}

extension MyClassSwap: SwapFirstLastCharactorDelegate, SwapFirstLastCharactorDataSource {
    func changCh(_ str: String, value: String) {
        print(value)
    }
    
    func addTheLastCh(_ str: String, value: String) {
        print(value)
    }
    
    func getString() -> String {
        return str
    }
}

let myClassSwap = MyClassSwap(str: "Hello")
myClassSwap.handle()






