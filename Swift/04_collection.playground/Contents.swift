import UIKit

/* 컬렉션 타입 */
/* Array, Dictonary, Set */

/*
 Array - 순서가 있는 리스트 컬렉션
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
 Set - 순서가 없고, 멤버가 유일한 컬렉션
*/

// MARK: - Array

// 빈 Int Array 생성
var integers: Array<Int> = Array<Int>() // [] 빈 배열 생성

// 추가
integers.append(1) // [1]
integers.append(100) // [1, 100]

//integers.append(101.1)
// error: Cannot convert value of type 'Double' to expected argument type 'Int'

// 포함여부 확인
integers.contains(100) // true
integers.contains(99) // false

// 삭제
integers.remove(at: 0) // 1
integers.removeLast() // 100
integers.removeAll() // []

// 크기 확인
integers.count // 0

// 빈 배열의 0번째 인덱스에 접근하는 경우
//integers[0]
// error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).

// Array<Double>와 [Double]는 동일한 표현
// [Double] 은 축약표현
// 빈 Double Array 생성
var doubles: Array<Double> = [Double]() // []

// 빈 String Array 생성
var strings: [String] = [String]() // []

// 빈 Character Array 생성
// []는 새로운 빈 Array
var characters: [Character] = [] // []

// let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1, 2, 3] // [1, 2, 3]

//immutableArray.append(4)
//immutableArray.removeAll()
// error: Cannot use mutating member on immutable value: 'immutableArray' is a 'let' constant



// MARK: - Dictionary

// Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
// [String: Any] 는 축약표현
var anyDictionary: Dictionary<String, Any> = [String: Any]() // [:]
anyDictionary["someKey"] = "value" // "value"
anyDictionary["anotherKey"] = 100 // 100

anyDictionary // ["someKey": "value", "anotherKey": 100]

// 값 새롭게 할당하기
anyDictionary["someKey"] = "dictionary" // "dictionary"
anyDictionary // ["someKey": "dictionary", "anotherKey": 100]

// 키에 해당하는 값 삭제
// .removeValue()와 nil로 변경하는 것은 같은 삭제명령.
anyDictionary.removeValue(forKey: "anotherKey") // 100
anyDictionary["someKey"] = nil // nil
anyDictionary // [:]

let emptyDictionary: [String: String] = [:] // [:]
let initalizedDictionary: [String: String] = ["name": "yeob", "gender": "male"] // ["name": "yeob", "gender": "male"]

//emptyDictionary["key"] = "value"
// error: Cannot assign through subscript: 'emptyDictionary' is a 'let' constant

//let someValue: String = initalizedDictionary["name"]
// error: Value of optional type 'String?' must be unwrapped to a value of type 'String'

// MARK: - Set (배열, 리스트)

// 빈 Int Set 생성
var integerSet: Set<Int> = Set<Int>() // Set([])

// 추가
integerSet.insert(1) // (inserted true, memberAfterInsert 1)
integerSet.insert(100) // (inserted true, memberAfterInsert 100)
integerSet.insert(99) // (inserted true, memberAfterInsert 99)
integerSet.insert(99) // (inserted false, memberAfterInsert 99)
integerSet.insert(99) // (inserted false, memberAfterInsert 99)

integerSet // {100, 99, 1}

// 포함여부 확인
integerSet.contains(1) // true
integerSet.contains(2) // false

// 삭제
integerSet.remove(100) // 100
integerSet.removeFirst() // 99

// 크기확인
integerSet.count // 1

// 생성 확인
let setA: Set<Int> = [1, 2, 3, 4, 5] // {5, 2, 3, 1, 4}
let setB: Set<Int> = [3, 4, 5, 6, 7] // {5, 6, 7, 3, 4}

// 합집합
let union: Set<Int> = setA.union(setB) // {2, 4, 5, 6, 7, 3, 1}

// 정렬 > 같은 타입의 배열로 변환
let sortedUnion: [Int] = union.sorted() // [1, 2, 3, 4, 5, 6, 7]

// 교집합
let intersection: Set<Int> = setA.intersection(setB) // {5, 3, 4}

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB) // {2, 1}
