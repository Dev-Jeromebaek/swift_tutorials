import UIKit

/* 프로퍼티 */

/*
 저장 프로퍼티(stored property)
 연산 프로퍼티(computed property)
 인스턴스 프로퍼티(instance property)
 타입 프로퍼티(type property)
 */

// 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다.
// 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있다.
// 연산 프로퍼티는 var로만 선언할 수 있다.

// MARK: - 정의

struct Student {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    /*
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
    */
    
    // 읽기전용 인스턴스 연산 프로퍼티
    // 위에 func selfIntroduce를 아래와 같이 get만 구현된 읽기전용 연산 프로퍼티로 대체할 수 있다.
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다."
        }
    }
    
    /*
    // 타입 메서드
    static func selfIntroduce() {
        print("학생타입입니다.")
    }
    */
    
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있다.
    static var selfIntroduction: String {
        return "학생타입입니다."
    }
}


// MARK: - 사용

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다.

// 인스턴스 생성
var yeob: Student = Student()
yeob.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
yeob.name = "yeob"
print(yeob.name)
// yeob

//인스턴스 연산 프로퍼티 사용
print(yeob.selfIntroduction)
// 저는 Swift반 yeob입니다.

print("제 한국나이는 \(yeob.koreanAge)살이고, 미국나이는 \(yeob.westernAge)살 입니다.")
// 제 한국나이는 10살이고, 미국나이는 9살입니다.


// MARK: - 응용

struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
            // set 에 매개변수명을 적지 않으면 newValue라는 이름으로 사용 가능하다.
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000
print(moneyInMyPocket)
// 11000

moneyInMyPocket.dollar = 10
print(moneyInMyPocket.won)
// 11000


// MARK: - 지역변수, 전역변수

// 저장 프로퍼티와 연산 프로퍼티의 기능은
// 함수, 메서드, 클로저, 타입 등의 외부에 위치한
// 지역/전역 변수에도 모두 사용 가능하다.
var a: Int = 100
var b: Int = 200
var sum: Int {
    return a + b
}

print(sum) // 300
