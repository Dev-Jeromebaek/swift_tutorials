import UIKit

/* 서브스크립트 */

// 서브스크립트는 별도의 설정자(Setter)또는 접근자(Getter) 등의
// 메서드를 구현하지 않아도 인덱스([1], [2], [3] ...)를 통해
// 값을 설정하거나 가져올 수 있다.

// 예를 들어 someArray라는 Array 인스턴스의 index를 통해 인덱스에 접근하고 싶다면,
// someArray[index], someDictionary의 경우 someDictionary[index]라고 표현하면 된다.

// MARK: - 서브스크립트 문법
// 시퀀스나 컬렉션, 리스트 등의 요소를 반환하고 설정할 때 주로 사용한다.

//struct Student {
//    var name: String
//    var number: Int
//}
//
//class School {
//    var number: Int = 0
//    var students: [Student] = [Student] ()
//
//    func addStudent(name: String) {
//        let student: Student = Student(name: name, number: self.number)
//        self.students.append(student)
//        self.number += 1
//    }
//
//    func addStudents(names: String...) {
//        for name in names {
//            self.addStudent(name: name)
//        }
//    }
//
//    subscript(index: Int) -> Student? {
//        if index < self.number {
//            return self.students[index]
//        }
//        return nil
//    }
//}
//
//let highSchool: School = School()
//highSchool.addStudents(names: "Yeob", "Baek", "Bob", "Jina", "huk")
//
//let aStudent: Student? = highSchool[1]
//print("\(aStudent?.number) \(aStudent?.name)") // Optional(1) Optional("Baek")


// MARK: - 복수 서크스크립트

// 다양한 매개변수 타입을 사용하여 서브스크립트를 구현하면
// 여러 용도로 서브스크립트를 사용할 수 있다.
// 단, 각각의 서브스크립트는 매개변수 타입과 개수, 반환타입이 모두 달라야한다.

//struct Student {
//    var name: String
//    var number: Int
//}
//
//class School {
//    var number: Int = 0
//    var students: [Student] = [Student] ()
//
//    func addStudent(name: String) {
//        let student: Student = Student(name: name, number: self.number)
//        self.students.append(student)
//        self.number += 1
//    }
//
//    func addStudents(names: String...) {
//        for name in names {
//            self.addStudent(name: name)
//        }
//    }
//
//    subscript(index: Int) -> Student? {
//        get {
//            if index < self.number {
//                return self.students[index]
//            }
//            return nil
//        }
//
//        set {
//            guard var newStudent: Student = newValue else {
//                return
//            }
//
//            var number: Int = index
//
//            if index > self.number {
//                number = self.number
//                self.number += 1
//            }
//
//            newStudent.number = number
//            self.students[number] = newStudent
//        }
//    }
//
//    // 두번째 서브스크립트
//    subscript(name: String) -> Int? {
//        get {
//            return self.students.filter { $0.name == name }.first?.number
//        }
//
//        set {
//            guard var number: Int = newValue else {
//                return
//            }
//
//            if number > self.number {
//                number = self.number
//                self.number += 1
//            }
//
//            let newStudent: Student = Student(name: name, number: number)
//            self.students[number] = newStudent
//        }
//    }
//
//    // 세번째 서브스크립트
//    subscript(name: String, number: Int) -> Student? {
//        return self.students.filter {
//            $0.name == name && $0.number == number
//        }.first
//    }
//}
//
//let highSchool: School = School()
//highSchool.addStudents(names: "Yeob", "Baek", "Bob", "Jina", "huk")
//
//let aStudent: Student? = highSchool[1]
//print("\(aStudent?.number) \(aStudent?.name)") // Optional(1) Optional("Baek")
//
//print(highSchool["Yeob"]) // Optional(0)
//print(highSchool["wimes"]) // nil
//
//highSchool[0] = Student(name: "SeungYeob", number: 0)
//highSchool["AA"] = 1
//
//print(highSchool["Baek"]) // nil
//print(highSchool[0]) // Optional(__lldb_expr_52.Student(name: "SeungYeob", number: 0))
//print(highSchool["AA"]) // Optional(1)
//print(highSchool["Jina", 3]) // Optional(__lldb_expr_52.Student(name: "Jina", number: 3))
//print(highSchool["HeeJin", 3]) // nil


// MARK: - 타입 서브스크립트
// 인스턴스가 아니라 타입 자체에서 사용할 수 있는 서브스크립트를 말한다.
// 타입 서브스크립트를 구현하려면 서브스크립트를 정의할 때
// subscript 키워드 앞에 static 키워드를 붙여주면 된다.

enum School: Int {
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School? {
        return Self(rawValue: level)
        // return School(rawValue: level)과 같은 표현
    }
}

let school: School? = School[2]
print(school) // Optional(__lldb_expr_54.School.middle)
