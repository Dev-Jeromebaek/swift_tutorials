import UIKit

/* 옵셔널 추출 */
// MARK: - 옵셔널 사용 방법
// Optional Binding - 옵셔널 바인딩
// - 옵셔널의 값을 꺼내오는 방법 중 하나로 nil 체크를 함과 동시에 안전한 값을 추출할 수 있는 방법

func printName(_ name: String) {
    print(name)
}

//var myName: String? = nil

//printName(myName)
// error: Value of optional type 'String?' must be unwrapped to a value of type 'String'
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생.
// 이러한 오류를 해결하기 위해 스위프트의 if-let 키워드를 사용해야함.

var myNameIfLet: String! = nil

if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}
// myName == nil


// name 상수는 if-let 구문 내에서만 사용가능하다.
//printName(name);
// error: Cannot find 'name' in scope
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생

// - 여러개의 옵셔널값 바인딩 하기
var myName: String? = "yeob"
var yourName: String? = nil

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
} // ""
// yourName은 nil이기 때문에 실행되지 않는다.

yourName = "baek"

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
} // yeob and baek


// Force Unwrapping - 강제 추출
// - 옵셔널의 값을 강제로 추출하는 방식

func printName(_ name: String) {
    print(name)
}

var myName: String? = "yeob"

printName(myName!) // yeob

myName = nil

//print(myName!)
// error: Unexpectedly found nil while unwrapping an Optional value
// 강제추출시 값이 없으므로 런타임 오류 발생

var yourName: String! = nil

//printName(yourName)
// error: Unexpectedly found nil while implicitly unwrapping an Optional value
// nil 값이 전달되기 때문에 런타임 오류 발생

