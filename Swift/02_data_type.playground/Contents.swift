import UIKit

/* 기본 데이터 타입 */

// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

// Bool
var someBool: Bool = true
someBool = false

// Bool 타입에 대해 bit 형식의 0 과 1 은 사용 불가.
//someBool = 0 // X
//someBool = 1 // X
// error: cannot assign value of type 'Int' to type 'Bool'

// Int
var someInt: Int = -100

//someInt = 100.1 // X
// error: cannot assign value of type 'Double' to type 'Int'

// UInt
// - Unsigned Int
// - 부호가 없는 정수 즉 양의 정수 타입
var someUInt: UInt = 100

//someUInt = -100 // X
// error: negative integer '-100' overflows when stored into unsigned type 'UInt'

//someUInt = someInt // X
// error: cannot assign value of type 'Int' to type 'UInt'

// Float
var someFloat: Float = 3.14
someFloat = 3 // O

// Double
var someDouble: Double = 3.14
someDouble = 3 // O

//someDouble = someFloat // X
// error: cannot assign value of type 'Float' to type 'Double'

// Character
// - 유니코드를 사용하기 때문에 유니코드로 표현할 수 있는 모든 문자를 넣어줄 수 있음.
// - 문자열과 똑같이 큰따옴표(")를 사용함
var someCharacter: Character = "🇰🇷"
someCharacter = "😄"
someCharacter = "가"
someCharacter = "A"

//someCharacter = "하하하" // X
// error: cannot assign value of type 'String' to type 'Character'
print(someCharacter)

// String
var someString: String = "하하하 😄"
someString = someString + "웃으면 복이와요"
// print(someString)

// someString = someCharacter // X
// error: cannot assign value of type 'Character' to type 'String'
