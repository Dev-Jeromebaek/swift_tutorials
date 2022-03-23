//
//  ContentView.swift
//  SwiftUI_Alamofire_RandomUser
//
//  Created by 백승엽 on 2022/03/22.
//

import SwiftUI
import UIKit
import Introspect

class RefreshControlHelper {
    //MARK: Properties
    var parentContentView: ContentView?
    var refreshControl: UIRefreshControl?
    
    @objc func didRefresh() {
        print(#fileID, #function, #line, "")
        guard let parentContentView = parentContentView,
              let refreshControl = refreshControl else {
            return print("parentContentView, refreshControl이 nil 입니다.")
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            print("리프레시가 되었다.")
            //MARK: - TODO: Api 다시 호출
//            parentContentView.randomUserViewModel.fetchRandomUsers()
            parentContentView.randomUserViewModel.refreshActionSubject.send()
            refreshControl.endRefreshing()
        })
    }
}

struct ContentView: View {
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    @State private var searchQuery: String = ""
    
    let refreshControlHelper = RefreshControlHelper()
    
    var body: some View {
        NavigationView {
            List(randomUserViewModel.randomUsers) { aRandomUser in
                RandomUserRowView(aRandomUser)
            }
            .listStyle(.plain)
            .navigationBarHidden(true)
//            .introspectTableView { tableView in
//                self.configureRefreshControl(tableView)
//            }
            .introspectTableView {
                self.configureRefreshControl($0)
                
            }
        }
    }
}

// MARK: - Helper Methods
extension ContentView {
    fileprivate func configureRefreshControl(_ tableView: UITableView) {
        print(#fileID, #function, #line, "")
        let myRefreshControl = UIRefreshControl()
        myRefreshControl.tintColor = .blue
        refreshControlHelper.refreshControl = myRefreshControl
        refreshControlHelper.parentContentView = self
        myRefreshControl.addTarget(refreshControlHelper, action: #selector(refreshControlHelper.didRefresh), for: .valueChanged)
        
        tableView.refreshControl = myRefreshControl
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
