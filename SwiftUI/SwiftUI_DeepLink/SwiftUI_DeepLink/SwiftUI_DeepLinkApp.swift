//
//  SwiftUI_DeepLinkApp.swift
//  SwiftUI_DeepLink
//
//  Created by 백승엽 on 2022/03/18.
//

import SwiftUI

@main
struct SwiftUI_DeepLinkApp: App {
    
    @State var selectedTab = TabIdentifier.todos
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                TodosView()
                    .tabItem {
                        VStack {
                            Image(systemName: "list.bullet")
                            Text("할 일 목록")
                        }
                    }.tag(TabIdentifier.todos)
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person.circle.fill")
                            Text("프로필")
                        }
                    }
                    .tag(TabIdentifier.profile)
            }
            .onOpenURL { url in
                /// 열려야 하는 url 처리
                guard let tabId = url.tabIdentifier else { return }
                selectedTab = tabId
            }
//            ContentView()
        }
    }
}

/// 어떤 앱이 선택되었는지 여부
enum TabIdentifier: Hashable {
    case todos, profile
}

/// 어떤 페이지를 보여줘야 하는지
enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    /// info에서 추가한 deeplink가 들어왔는지 여부
    var isDeeplink: Bool {
        return scheme == "test-deeplink-swiftui"
    }
    
    /// url 들어오는 것으로 어떤 타입의 탭을 보여줘야 하는지 가져오기
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else { return nil }
        
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default:
            return nil
        }
    }
    
    var detailPage: PageIdentifier? {
        
        
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
            else { return nil }
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
}
