//
//  Home.swift
//  MVVM_pattern
//
//  Created by 백승엽 on 2022/03/30.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var users = FetchAccounts()
    
    var body: some View {
        
        // ScrollView Loading Problem...
        
        ZStack {
            if self.users.accounts.isEmpty {
                Indicator()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        
                        // Content...
                        
                        // Card View...
                        ForEach(self.users.accounts) { user in
                            CardView(accountDetails: user)
                        }
                        
                    }// VStack
                }// ScrollView
            }
        }//ZStack
        .onAppear() {
            
            // Fetcing Accounts...
            
            // Or You can call it in init...
            
            self.users.fetchUsers()
        }
        .navigationBarTitle("Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
