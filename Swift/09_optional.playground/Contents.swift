import UIKit

/* 옵셔널 */
// - 값이 있을 수도, 없을 수도 있음
// - 옵셔널이 왜 필요할까?
//   - nil의 가능성을 문서화 하지 않아도 코드만으로 충분히 표현가능
//     - 문서/주석 작성 시간 절약
//   - 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용
//     - 효율적인 코딩
//     - 예외 상황을 최소화하는 안전한 코딩


let optionalConstant: Int? = nil // O
//let someConstant: Int = nil // X
// error: 'nil' cannot initialize specified type 'Int'


// someOptionalParam can be nil
func someFunction(someOptionalParam: Int?) {
    // ...
}

// someParam must not be nil
func someFunction(someParam: Int) {
    // ...
}

someFunction(someOptionalParam: nil)
//someFunction(someParam: nil)
// error: 'nil' is not compatible with expected argument type 'Int'


// 옵셔널은 enum + general을 합한 것과 같다고 할 수 있다.
// 1. enum + general
//enum Optional<Wrapped> : ExpressibleByNilLiteral {
//    case none
//    case some(Wrapped)
//}
//
//let optionalValue: Optional<Int> = nil
//
//// 2. optional
//let optionalValue: Int? = nil


// MARK: - 옵셔널 표현 방법

// ! (exclamation mark) - 암시적 추출 옵셔널
//var optionalValue: Int! = 100
//
//switch optionalValue {
//case .none:
//    print("This Optional variable is nil")
//case .some(let value):
//    print("Value is \(value)")
//} // Value is 100
//
//// 기존 변수처럼 사용 가능
//optionalValue = optionalValue + 1
//print(optionalValue) // Optional(101)
//
//// nil 할당 가능
//optionalValue = nil
//print(optionalValue) // nil

// 잘못된 접근으로 인한 런타임 오류 발생
//optionalValue = optionalValue + 1
// error: Unexpectedly found nil while implicitly unwrapping an Optional value
// 이미 optionalValue에 nil이 할당되어있으므로 + 1 과 같은 수식을 사용할 수 없음


// ? (question mark)
var optionalValue: Int? = 100

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
} // Value is 100

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1 // X
// error: Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
