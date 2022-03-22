//
//  RandomUserViewModel.swift
//  SwiftUI_Alamofire
//
//  Created by 백승엽 on 2022/03/22.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    // MARK: Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserData.self) // json형태로 받은걸 swift객체로 만들어줌
            .compactMap{ $0.value }
            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { revicedValue in
                print("받은 값: \(revicedValue.count)")
                self.randomUsers = revicedValue
            }).store(in: &subscription)
    }
    
}
