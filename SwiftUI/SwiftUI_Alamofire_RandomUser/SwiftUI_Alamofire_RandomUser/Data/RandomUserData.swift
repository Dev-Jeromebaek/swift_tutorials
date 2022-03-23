//
//  RandomUserData.swift
//  SwiftUI_Alamofire
//
//  Created by 백승엽 on 2022/03/22.
//

import Foundation

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    var id = UUID()
    var name: Name
    var photo: Photo
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        // 실제 가져오는 key값은 picture지만 여기서는 photo라는 변수로 사용할거라는 것을 명시
        case photo = "picture"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImageUrl: URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
}

// 비교를 위한 Equatable 프로토콜
extension RandomUser: Equatable {
    static func == (lhs: RandomUser, rhs: RandomUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}

struct Name: Codable, CustomStringConvertible {
    var title: String
    var first: String
    var last: String
    
    var description: String {
        return "[\(title) \(last) \(first)]"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "Nabiee Inc.", first: "백승엽", last: "대표이사")
    }
}

struct Photo: Codable {
    var large: String
    var medium: String
    var thumbnail: String
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/men/75.jpg", medium: "https://randomuser.me/api/portraits/men/75.jpg", thumbnail: "https://randomuser.me/api/portraits/men/75.jpg")
    }
}


struct Info: Codable, CustomStringConvertible {
    var seed: String
    var resultsCount: Int
    var page: Int
    var version: String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
    
    var description: String {
        return "seed: \(seed) / version: \(version) / resultsCount: \(resultsCount) / page: \(page)"
    }
}


struct RandomUserData: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    // 설명을 커스텀하기 위해서는 CustomStringConvertible를 추가해줘야함.
    var description: String {
        return "results.count: \(results.count) / info: \(info.seed)"
    }
    
}

