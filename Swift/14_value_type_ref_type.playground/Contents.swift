import UIKit

/* 클래스, 구조체/열거형 비교 */

// MARK: - Class vs Struct/Enum

struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)") // 1
print("second struct instance property : \(secondStructInstance.property)") // 2

let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class instance property : \(firstClassReference.property)") // 2
print("second class instance property : \(secondClassReference.property)") // 2

// 예제 struct

struct SomeStruct {
    var someProperty: String = "Property"
}

var someStructInstance: SomeStruct = SomeStruct()

func someFunction(structInstance: SomeStruct) {
    var localVar: SomeStruct = structInstance
    localVar.someProperty = "ABC"
}

someFunction(structInstance: someStructInstance)
print(someStructInstance.someProperty) // "Property"

// 예제 class

class SomeClass {
    var someProperty: String = "Property"
}

var someClassInstance: SomeClass = SomeClass()

func someFunction(classInstance: SomeClass) {
    var localVar: SomeClass = classInstance
    localVar.someProperty = "ABC"
}

someFunction(classInstance: someClassInstance)
print(someClassInstance.someProperty) // "ABC"


// Swift의 데이터 타입 구조 확인
//public struct Int
//public struct Double
//public struct String
//public struct Dicionary<Key: Hashable, Value>
//public struct Array<Element>
//public struct Set<Element: Hashable>
