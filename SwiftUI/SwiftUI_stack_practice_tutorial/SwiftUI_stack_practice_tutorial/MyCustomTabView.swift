//
//  MyCustomTabView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/16.
//

import SwiftUI

enum TabIndex {
//    case home
//    case cart
//    case profile
    case home, cart, profile
}

struct MyCustomTabView: View {
    
    @State var tabIndex: TabIndex
    @State var largerScale: CGFloat = 1.4
    
    func changeMyView(tabIndex: TabIndex) -> MyTabItemView{
        switch tabIndex {
        case .home:
            return MyTabItemView(title: "home", bgColor: Color.green)
        case .cart:
            return MyTabItemView(title: "cart", bgColor: Color.purple)
        case .profile:
            return MyTabItemView(title: "profile", bgColor: Color.blue)
        default:
            return MyTabItemView(title: "home", bgColor: Color.green)
        }
    }
    
    func changeIconColor(tabIndex: TabIndex) -> Color {
        switch tabIndex {
        case .home:
            return Color.green
        case .cart:
            return Color.purple
        case .profile:
            return Color.blue
        default:
            return Color.green
        }
    }
    
    func calcCircleBgPosition(tabIndex: TabIndex, geoProxy: GeometryProxy) -> CGFloat {
        switch tabIndex {
        case .home:
            return -(geoProxy.size.width / 3)
        case .cart:
            return 0
        case .profile:
            return geoProxy.size.width / 3
        default:
            return -(geoProxy.size.width / 3)
        }
    }
    
    
    var body: some View {
        GeometryReader { geoProxy in
            ZStack(alignment: .bottom) {
                self.changeMyView(tabIndex: self.tabIndex)
                
                Circle()
                    .frame(width: 90, height: 90)
                    .offset(x: self.calcCircleBgPosition(
                        tabIndex: self.tabIndex, geoProxy: geoProxy), y: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : -5)
                    .foregroundColor(Color.white)
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Button(action: {
                            print("home 클릭")
                            withAnimation {
                                self.tabIndex = .home
                            }
                        }) {
                            Image(systemName: "house.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .home ? self.largerScale : 1.0)
                                .foregroundColor(self.tabIndex == .home ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
                                .frame(width: geoProxy.size.width / 3, height: 50)
                                .offset(y: self.tabIndex == .home ? -10 : 0)
                        }
                        .background(Color.white)
                        
                        Button(action: {
                            print("home 클릭")
                            withAnimation {
                                self.tabIndex = .cart
                            }
                        }) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .cart ? self.largerScale : 1.0)
                                .foregroundColor(self.tabIndex == .cart ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
                                .frame(width: geoProxy.size.width / 3, height: 50)
                                .offset(y: self.tabIndex == .cart ? -10 : 0)
                        }
                        .background(Color.white)
                        
                        Button(action: {
                            print("home 클릭")
                            withAnimation {
                                self.tabIndex = .profile
                            }
                        }) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 25))
                                .scaleEffect(self.tabIndex == .profile ? self.largerScale : 1.0)
                                .foregroundColor(self.tabIndex == .profile ? self.changeIconColor(tabIndex: self.tabIndex) : .gray)
                                .frame(width: geoProxy.size.width / 3, height: 50)
                                .offset(y: self.tabIndex == .profile ? -10 : 0)
                        }
                        .background(Color.white)
                    } // HStack
                    Rectangle()
                        .foregroundColor(Color.white)
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                } // VStack
            } // ZStack
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MyCustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomTabView(tabIndex: .home)
    }
}
