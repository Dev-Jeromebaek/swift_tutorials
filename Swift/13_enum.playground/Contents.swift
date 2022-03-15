import UIKit

/* 열거형 */

// MARK: - 정의
// - enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의한다.
// 각 case는 소문자 카멜케이스로 정의한다.
// 각 case는 그 자체가 고유 값이다.

// enum 이름(대문자) {
//     case 이름1(소문자)
//     case 이름2(소문자)
//     case 이름3(소문자), 이름4(소문자), 이름5(소문자)
//     ...
// }


// MARK: - 열거형 사용

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue

print(day)

switch day {
case .mon, .tue, .wed, .thu:
    print("평일")
case Weekday.fri:
    print("불금")
//case .sat, .sun:
//    print("주말")
default :
    print("주말")
}


// MARK: - 원시값
// - C 언어의 enum처럼 정수값을 가질 수도 있다.
// rawValue를 사용하면 된다.
// case별로 각각 다른 값을 가져야한다.

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
//    case mango = 0
//    error: Raw value for enum case is not unique
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2

// 정수 타입 뿐만 아니라
// Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 저정될 수 있다.

// *Hashable 프로토콜
// - 정수 해시 값을 제공하고 Dictionary의 키가 될 수 있는 타입.
//   (Dictionary의 key value는 Hashable 프로토콜을 만족하는 타입이여야 한다.)
//   다르게 말하면 value가 hashable해야할 때, Hashable 프로토콜을 채택해서 구현해주면 hashable이 보장된 정수 해시 값을 제공함.
//   구조체(Strucrue)의 저장프로퍼티는 모두 Hashable을 준수해야한다.
//   열거형(Enumeration)의 모든 연관값(associated values)은 모두 Hashable을 준수해야한다.


enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// School.middle.rawValue == 중등

// 값이 할당되지 않은 case를 가져오면 case의 이름 그대로를 가져온다.
print("School.university.rawValue == \(School.university.rawValue)")
// School.university.rawValue == university


// MARK: 원시값을 통한 초기화

// rawValue를 통해 초기화 할 수 있다.
// rawValue가 case에 해당하지 않을 수 있으므로
// rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다.

//let apple: Fruit = Fruit(rawValue: 0)
// error: Value of optional type 'Fruit?' must be unwrapped to a value of type 'Fruit'

let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다.")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
} // rawValue 5에 해당하는 케이스가 없습니다.


// MARK: 메서드

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("봄")
        case .jun, .jul, .aug:
            print("여름")
        case .sep, .oct, .nov:
            print("가을")
        case .dec, .jan, .feb:
            print("겨울")
        }
    }
}

Month.mar.printMessage() // 봄
