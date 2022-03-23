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
    @Published var pageInfo: Info? {
        didSet {
            print("pageInfo: \(pageInfo)")
        }
    }
    
    @Published var isLoading: Bool = false
    
    var refreshActionSubject = PassthroughSubject<(), Never>()
    var fetchMoreActionSubject = PassthroughSubject<(), Never>()
    
    //    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
        
        refreshActionSubject.sink { _ in
            //            guard let self = self else { return }
            print("RandomUserViewModel - init - refreshActionSubject")
            self.fetchRandomUsers()
        }.store(in: &subscription)
        
        fetchMoreActionSubject.sink { _ in
            print("RandomUserViewModel - init - fetchMoreActionSubject")
            if !self.isLoading {
                self.fetchMore()
            }
        }.store(in: &subscription)
    }
    
    fileprivate func fetchMore() {
        print(#fileID, #function, #line, "")
        guard let currentPage = pageInfo?.page else {
            print("페이지 정보가 없습니다.")
            return
        }
        
        self.isLoading = true
        
        let pageToLoad = currentPage + 1
        AF.request(RandomUserRouter.getUsers(page: pageToLoad))
            .publishDecodable(type: RandomUserData.self) // json형태로 받은걸 swift객체로 만들어줌
            .compactMap{ $0.value }
        //            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
                self.isLoading = false
            }, receiveValue: { revicedValue in
                print("받은 값: \(revicedValue.results.count)")
                self.randomUsers += revicedValue.results
                self.pageInfo = revicedValue.info
            }).store(in: &subscription)
    }
    
    fileprivate func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        AF.request(RandomUserRouter.getUsers())
            .publishDecodable(type: RandomUserData.self) // json형태로 받은걸 swift객체로 만들어줌
            .compactMap{ $0.value }
        //            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터 스트림 완료")
            }, receiveValue: { revicedValue in
                print("받은 값: \(revicedValue.results.count)")
                self.randomUsers = revicedValue.results
                self.pageInfo = revicedValue.info
            }).store(in: &subscription)
    }
    
}
