import UIKit

/* 타입캐스팅 */

// 스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도 또는
// 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로
// 사용할 수 있는지 확인하는 용도로 사용한다.
// is 혹은 as를 사용한다.

// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다.")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다.")
    }
}

// 타입 캐스팅을 위한 인스턴스 생성
var yeob: Person = Person()
var AA: Student = Student()
var BB: UniversityStudent = UniversityStudent()

// MARK: - 타입 확인
// is를 사용하여 타입을 확인한다.

var result: Bool

result = yeob is Person // true
result = yeob is Student // false
result = yeob is UniversityStudent // false

result = AA is Person // true
result = AA is Student // true
result = AA is UniversityStudent // false

result = BB is Person // true
result = BB is Student // true
result = BB is UniversityStudent // true

if yeob is UniversityStudent {
    print("yeob은 대학생입니다.")
} else if yeob is Student {
    print("yeob은 학생입니다.")
} else if yeob is Person {
    print("yeob은 사람입니다.")
} // yeob은 사람입니다.

switch BB {
case is Person:
    print("BB은 사람입니다.")
case is Student:
    print("BB은 학생입니다.")
case is UniversityStudent:
    print("BB은 대학생입니다.")
default:
    print("BB은 사람도, 학생도, 대학생도 아닙니다.")
} // BB은 사람입니다.

switch BB {
case is UniversityStudent:
    print("BB은 대학생입니다.")
case is Student:
    print("BB은 학생입니다.")
case is Person:
    print("BB은 사람입니다.")
default:
    print("BB은 사람도, 학생도, 대학생도 아닙니다.")
} // BB은 대학생입니다.


// MARK: - 업 캐스팅
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 타입정보를 전환해준다.
// Any 혹은 AnyObject로도 타입정보를 변환할 수 있다.
// 암시적으로 처리되므로 생략해도 무방하다.

var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent
// error: 'Person' is not convertible to 'UniversityStudent'; did you mean to use 'as!' to force downcast?
var jina: Any = Person() // as Any 생략 가능


// MARK: - 다운 캐스팅
// as? 또는 as!를 사용하여
// 자식 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 인스턴스의 타입정보를 전환해준다.

// MARK: 조건부 다운캐스팅
// as?

var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

// MARK: 강제 다운캐스팅
// as!

var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
//forcedCasted = jenny as! UniversityStudent
//forcedCasted = jina as! UniversityStudent
//forcedCasted = jina as! Student
// error: Execution was interrupted, reason: signal SIGABRT.

// 활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
// 멤버쉽 트레이닝을 갑니다.

doSomethingWithSwitch(someone: mike)
// 멤버쉽 트레이닝을 갑니다.

doSomethingWithSwitch(someone: jenny)
// 등교를 합니다.

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)
// 멤버쉽 트레이닝을 갑니다.

doSomething(someone: mike)
// 멤버쉽 트레이닝을 갑니다.

doSomething(someone: jenny)
// 등교를 합니다.

doSomething(someone: yeob)
// 숨을 쉽니다.
