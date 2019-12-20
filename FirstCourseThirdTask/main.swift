// Этот файл пуст не по ошибке. В этот раз вам необходимо самостоятельно импортировать необходимые модули и запустить проверку
import Foundation
import FirstCourseThirdTaskChecker

class Stack: ArrayInitializableStorage {
  var array: [Int]
  override var count: Int {
    return array.count
  }
  
  required init(array: [Int]) {
    self.array = array
    super.init()
  }
  
  required init() {
    array = [Int]()
    super.init()
  }
  
  override func push(_ element: Int) {
    array.append(element)
  }
  
  override func pop() -> Int {
    return array.removeLast()
  }
}

class Queue: ArrayInitializableStorage {
  var array: [Int]
  override var count: Int {
    return array.count
  }
  
  required init(array: [Int]) {
    self.array = array
    super.init()
  }
  
  required init() {
    array = [Int]()
    super.init()
  }
  
  override func push(_ element: Int) {
    array.append(element)
  }
  
  override func pop() -> Int {
    return array.removeFirst()
  }
}

var stack = Stack()
var queque = Queue()

var checker = Checker()
checker.checkInheritance(stack: stack, queue: queque)

struct StackWithProtocols: StorageProtocol, ArrayInitializable {
  var array: [Int]
  var count: Int {
    return array.count }
  
  init() {
    array = [Int]()
  }
  
  mutating func push(_ element: Int) {
    array.append(element)
  }
  
  mutating func pop() -> Int {
    return array.removeLast()
  }
  
  init (array: [Int]) {
    self.array = array
  }
}

struct QuequeWithProtocols: StorageProtocol, ArrayInitializable {
  var array: [Int]
  var count: Int {
    return array.count }
  
  init() {
    array = [Int]()
  }
  
  mutating func push(_ element: Int) {
    array.append(element)
  }
  
  mutating func pop() -> Int {
    return array.removeFirst()
  }
  
  init (array: [Int]) {
    self.array = array
  }
}

var stackWithProtocols = StackWithProtocols()
var quequeWithProtocols = QuequeWithProtocols()

checker.checkProtocols(stack: stackWithProtocols, queue: quequeWithProtocols)

extension User: JSONInitializable {
  public convenience init(JSON: String) {
    self.init()
    
    guard let jsonData = JSON.data(using: .utf8) else {
      return
    }
    guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
        return
    }
    guard let name = jsonDictionary?["fullName"] as? String,
          let email = jsonDictionary?["email"] as? String
      else {
        return
    }
    self.fullName = name
    self.email = email
  }
}

extension User: JSONSerializable {
  public func toJSON() -> String {
    return "{\"fullName\": \"\(fullName)\", \"email\": \"\(email)\"}"
  }
}

checker.checkExtensions(userType: User.self)
