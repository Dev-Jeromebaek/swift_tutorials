import UIKit

/* 인스턴스의 생성과 소멸 */

// 이니셜라이저와 디이니셜라이저
// init, deinit

// MARK: - 프로퍼티 기본값

// 스위프트의 모든 인스턴스는 초기화와 동시에
// 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다.
// 프로퍼티에 미리 기본값을 할당해두면
// 인스턴스가 생성됨과 동시에 초기값을 지니게 된다.

class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let yeob: PersonA = PersonA()
yeob.name = "yeob"
yeob.age = 30
yeob.nickName = "y"


// MARK: - 이니셜라이저

// 프로퍼티 기본값을 지정하기 어려운 경우에는
// 이니셜라이저를 통해
// 인스턴스가 가져야 할 초기값을 전달할 수 있다.

class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let BB: PersonB = PersonB(name: "BB", age: 20, nickName: "B")


// MARK: 프로퍼티의 초기값이 꼭 필요 없는 경우
// 옵셔널을 사용!

class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    convenience init(name:String, age: Int, nickName: String) {
        // self.name = name
        // self.age = age
        // name과 age에 대한 이니셜라이저가 아래 생성되어있기 때문에 다음과같이 이니셜라이저를 호출해주면
        // 직접 name과 age에 대한 초기화를 명시하지 않아도 된다.
        self.init(name: name, age: age)
        // 단 다른 이니셜라이저를 호출할 때는 init 함수 앞에 convenience라는 키워드를 적어주면 된다.
        // convenience init은 편의 이니셜라이저라고 칭함.
        self.nickName = nickName
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let CC: PersonC = PersonC(name: "CC", age: 10)
let CC2: PersonC = PersonC(name: "CC2", age: 15, nickName: "C2")

// 암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만
// 초기값을 할당하지 않고자 할 때 사용한다.
// 즉, 이니셜라이저 과정에서 전달되기 어려운 값들을 칭한다.
// 아래 Puppy 클래스를 설명하면 name을 먼저 설정하고 owner는 나중에 설정하겠다고 명시하는 것과 같음.
// 단, 나중에 owner를 설정하지 않으면 에러가 발생.
class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 한다.")
    }
}

let doggy: Puppy = Puppy(name: "doggy")
//doggy.goOut()
// error: Execution was interrupted
// 강아지는 주인 없이 산책을 갈 수 없음
doggy.owner = CC
doggy.goOut()
// doggy가 주인 CC와 산책을 합니다.


// MARK: 실패 가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있다.
// 인스턴스 생성에 실패하면 nil을 반환한다.
// 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입이다.

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let AA2: PersonD = PersonD(name: "AAA", age: 23 )
// error: Value of optional type 'PersonD?' must be unwrapped to a value of type 'PersonD'
let AA3: PersonD? = PersonD(name: "AAA", age: 23 )
let BBB2: PersonD? = PersonD(name: "BBB", age: 123 ) // nil
let CCC2: PersonD? = PersonD(name: "CCC", age: 12 )
let CCC3: PersonD? = PersonD(name: "", age: 11 ) // nil


// MARK: - 디이니셜라이저

// deinit은 클래스의 인스턴스가
// 메모리에서 해제되는 시점에 호출된다.
// 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있다.

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: CC)
donald?.pet = doggy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제된다.
// donald가 CC에게 doggy를 인도합니다.
