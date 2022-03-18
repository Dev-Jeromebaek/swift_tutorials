//
//  TodosView.swift
//  SwiftUI_DeepLink
//
//  Created by 백승엽 on 2022/03/18.
//

import SwiftUI

struct TodoItem: Identifiable, Hashable {
    var id: UUID
    var title: String
}

func prepareData() -> [TodoItem] {
    print("prepareData() called")
    
    var newList = [TodoItem]()
    
    for i in 0...20 {
        let newTodo = TodoItem(id: UUID(), title: "할일 \(i)")
        print("newTodo.id: \(newTodo.id) / titld: \(newTodo.title)")
        newList.append(newTodo)
    }
    return newList
    
}

// Todos의 해당아이디로 링크
//test-deeplink-swiftui://todos/B66E101E-44E1-4800-B179-3A41F46C9758
struct TodosView: View {
    
    @State var todoItems = [TodoItem]()
    @State var activeUUID: UUID?
    
    // 생성자 메소드
    init() {
        _todoItems = State(initialValue: prepareData())
    }
    
    var body: some View {
        NavigationView {
            List(todoItems) { todoItem in
                
                NavigationLink(
                    destination: Text("\(todoItem.title)"), // 화면을 변경하고싶으면 이부분을 변경해주면 됨
                    tag: todoItem.id,
                    /// activeUUID 값이 변경되면 해당하는 링크로 이동
                    selection: $activeUUID,
                    label: {
                        Text("\(todoItem.title)")
                    }
                )
            }
            .navigationTitle(Text("할 일 목록"))
            .listStyle(GroupedListStyle())
            .onOpenURL { url in
                if case .todoItem(let id) = url.detailPage {
                    print("넘어온 id: \(id)")
                    activeUUID = id
                }
            }
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView()
    }
}
