import UIKit

/* 이름짓기 규칙*/

// - Lower Camel Case : function, method, variable, constant
// ex) someVariableName

// - Upper Camel Case : type(class, struct, enum, extension, ...)
// ex) Person, Point, Week

// Swift는 대소문자를 구분한다!

/* ######################################### */

/* 콘솔로그 */

// - print
//   - 단순 문자열 출력

// - dump
//   - 인스턴스의 자세한 설명(description 프로퍼티)까지 출력

/* ######################################### */

/* 문자열 보간법 */

// - String Interpolation
// - 프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용
// - \()

/* ######################################### */

/* 콘솔로그와 문자열 보간법 */

let age: Int = 10

"안녕하세요! 저는 \(age)살 입니다."
// == "안녕하세요! 저는 10살 입니다."

"안녕하세요! 저는 \(age + 5)살 입니다."
// == "안녕하세요! 저는 15살 입니다."

print("안녕하세요! 저는 \(age + 5)살 입니다.")

print("\n#####################\n")

class Person {
    var name: String = "jerome"
    var age: Int = 10
}

let jerome: Person = Person()

print(jerome)

print("\n######################\n")

dump(jerome)
