import UIKit

/* 반복문 */

var integers = [1, 2, 3]
let people = ["yeob": 10, "AA": 15, "BB": 12]

// MARK: - for-in

// for item in items {
//     code
// }

// 반복문 사용 for-in
for integer in integers {
    print(integer)
}

// Dictionary의 item은 key와 value로 구성된 튜플 타입.
for (name, age) in people {
    print("\(name): \(age)")
}


// MARK: - while

// while condition {
//     code
// }

// condition의 소괄호는 선택사항 써도되고 안써도된다.
while (integers.count > 1) {
    integers.removeLast()
    print(integers)
}


// MARK: - repeat-while

// repeat {
//     code
// } while condition
//

// do-while문과 같음
repeat {
    integers.removeLast()
    print(integers)
} while integers.count > 0
