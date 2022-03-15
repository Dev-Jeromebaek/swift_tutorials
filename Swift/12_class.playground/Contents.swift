import UIKit

/* 클래스 */

// MARK: - 정의
// - 구조체와 매우 유사
// - 구조체는 값 타입인 반면 클래스는 참조타입
// - 다중상속불가.

// class 이름 {
//     구현부
// }


// MAKR: 프로퍼티 및 메서드

class Sample {
    var mutableProperty: Int = 100 // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
}

// 타입 메서드
// 재정의 불가 타입 메서드 - static
static func typeMethod() {
    print("type method - static")
}

// 재정의 가능 타입 메서드 - class
class func classMethod() {
    print("type method - class")
}


// MARK: 클래스 사용

var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
//mutableReference.immutableProperty = 200
// error: Cannot assign to property: 'immutableProperty' is a 'let' constant

let immutableReference: Sample = Sample()

immutableReference.mutableProperty = 200
//immutableReference.immutableProperty = 200
// error: Cannot assign to property: 'immutableProperty' is a 'let' constant

//immutableReference = mutableReference
// error: Cannot assign to value: 'immutableReference' is a 'let' constant

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

//mutableReference.typeProperty = 400
// error: Static member 'typeProperty' cannot be used on instance of type 'Sample'

//mutableReference.typeMethod()
// error: Static member 'typeMethod' cannot be used on instance of type 'Sample'


// MARK: - 학생 구조체

class Student {
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

// let으로 선언했음에도 불구하고 프로퍼티를 변경할 수 있음.
let AA: Student = Student()
AA.name = "AA"
AA.selfIntroduce() // 저는 Swift반 unknown입니다.
