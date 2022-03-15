import UIKit

/* 구조체 */

// MARK: - 정의
// - 스위프트는 대부분의 타입이 구조체로 이루어져있을 정도로
//   구조체는 스위프트에서 굉장히 중요한 역할을 하고 있다.
// - 스위프트 구조체는 타입을 정의하는 것이기 때문에 대문자 CamelCase를 사용한다.

// struct 이름 {
//     구현부
// }


// MAKR: 프로퍼티 및 메서드

struct Sample {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    static func typeMethod() {
        print("type method")
    }
}


// MARK: 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()

mutable.mutableProperty = 200
//mutable.immutableProperty = 200
// error: Cannot assign to property: 'immutableProperty' is a 'let' constant

// 불변 인스턴스
let immutable: Sample = Sample()

//immutable.mutableProperty = 200
// error: Cannot assign to property: 'immutable' is a 'let' constant

//immutable.immutableProperty = 200
// error: Cannot assign to property: 'immutableProperty' is a 'let' constant

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

//mutable.typeProperty = 400
// error: Static member 'typeProperty' cannot be used on instance of type 'Sample'
//mutable.typeMethod()
// error: Static member 'typeMethod' cannot be used on instance of type 'Sample'


// MARK: - 학생 구조체

struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    // class 자체가 swift에서 키워드로 사용되기 때문에 이런 경우 ``로 묶으면 문자열로 처리 되어 사용할 수 있다.
    
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce() // 학생타입입니다.

var yeob: Student = Student()
yeob.name = "yeob"
yeob.class = "스위프트"
yeob.selfIntroduce() // 저는 스위프트반 yeob입니다.

let AA: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//AA.name = "AA"
AA.selfIntroduce() // 저는 Swift반 unknown입니다.
