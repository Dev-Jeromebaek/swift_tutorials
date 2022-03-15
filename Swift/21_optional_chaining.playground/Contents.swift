import UIKit

/* 옵셔널 체이닝 */

// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있다.
// 옵셔널 체이닝이 실행 후 결과값이 nil일 수도 있으므로 결과 타입도 옵셔널이다.

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

// 인스턴스 생성
let yeob: Person? = Person(name: "yeob")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")


// 예제) 경비원의 직업이 궁금하다는 가정하에 옵셔널체이닝 사용여부에 다른 코드 비교

// 옵셔널 체이닝을 사용하지 않는다면
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다.")
                } else {
                    print("우리집 경비원은 직업이 없어요.")
                }
            }
        }
    }
}

guardJob(owner: yeob)

// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    } else {
        print("우리집 경비원은 직업이 없어요.")
    }
}

guardJobWithOptionalChaining(owner: yeob)
// 우리집 경비원은 직업이 없어요.


// MARK: 생성된 클래스 및 인스턴스를 활용

yeob?.home?.guard?.job // nil
// 현재 yeob에 home이 할당되어 있지 않기 때문에 home 부분에서 실행이 종료되고 nil을 반환한 상태
yeob?.home = apart
// yeob에 home을 apart로 할당
yeob?.home // Optional(Apartment)


yeob?.home?.guard // nil
// 현재 home에 guard가 할당되어 있지 않기 때문에 nil을 반환
yeob?.home?.guard = superman
// home의 guard를 superman으로 할당
yeob?.home?.guard // Optional(Person)


yeob?.home?.guard?.name // superman
yeob?.home?.guard?.job // nil
// 현재 guard에 superman을 할당 한 상태로
// superman의 name은 superman이다.
// 그러나, job은 할당 되어 있지 않기 떄문에 nil을 반환

yeob?.home?.guard?.job = "경비원"
// guard의 job을 superman으로 할당

// 즉, 중간에 어느 하나라도 nil값이라면 그 상황에 멈춘 상태로 nil을 반환한다.


// MARK: - nil 병합 연산자

// 만약 선언한 값이 nil이라면 nil 대신 다른 값을 반환하도록 정의할 수 있다.
// 키워드는 ?? 를 사용한다.

var guardJob: String

// yeob?.home?.guard?.job의 값이 nil이라면 "슈퍼맨"을 guardJob에 할당한다.
guardJob = yeob?.home?.guard?.job ?? "슈퍼맨"
// job이 "경비원"으로 할당 된 상태이므로
// yeob?.home?.guard?.job의 값이 그대로 유지 된다.
print(guardJob) // 경비원

// job을 nil로 초기화
yeob?.home?.guard?.job = nil

guardJob = yeob?.home?.guard?.job ?? "슈퍼맨"
// job이 nil이기 때문에 뒤에 선언한 "슈퍼맨"이 guardJob으로 할당 된다.
print(guardJob) // 슈퍼맨
