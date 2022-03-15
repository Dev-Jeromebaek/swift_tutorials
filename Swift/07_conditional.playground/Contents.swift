import UIKit

/* 조건문 */

let someInteger = 100

// MARK: - if-else

// if condition {
//      statements
// } else if condition {
//      statements
// } else {
//      statements
// }

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
} // 100

// 스위프트의 조건에는 항상 Bool 타입이 들어와야한다.
// someInteger는 Bool 타입이 아닌 Int 타입이기 때문에
// 컴파일 오류가 발생
//if someInteger { }
// error: Type 'Int' cannot be used as a boolean; test for '!= 0' instead


// MARK: - switch

// switch value {
// case pattern:
//     code
// default:
//     code
// }

// 범위 연산자를 활용하면 더욱 쉽고 유용하다.
// 1..<100 / 101...Int.max
switch someInteger {
case 0:
    print("zero")
case 1..<100: // 1이상 100미만
    print("1~99")
case 100:
    print("100")
case 101...Int.max: // 101이상 max 이하
    print("over 100")
default:
    print("unknown")
} // 100

// 정수 외에 대부분의 기본 타입을 사용할 수 있다.
switch "yeob" {
case "AA":
    print("AA")
case "BB":
    print("BB")
case "yeob":
    print("yeob!!")
default:
    print("unknown")
} // yeob!!

// fallthrough 키워드 사용
//
switch "yeob" {
case "AA":
    print("AA")
case "yeob":
    print("yeob!")
    // fallthrough - 이번 case를 마치고 switch 구문을 탈출하지 않고 다음 case인 [case 3:] 으로 넘어감.
    fallthrough
case "CC":
    print("what?")
    break // break 키워드를 통한 종료는 선택 사항
default:
    print("unknown")
} // yeob! what?

