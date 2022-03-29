//
//  ScrollViewHelper.swift
//  ScrollView_Offset_tutorial
//
//  Created by 백승엽 on 2022/03/29.
//

import Foundation
import UIKit
import Combine


/// 스크롤뷰 헬퍼
class ScrollViewHelper: NSObject, UIScrollViewDelegate, ObservableObject {
    
    @Published var isBottomPosition: Bool = false
    
    let threshold: CGFloat
    
    /// 해당 이벤트(지정한 bottom 위치 값)에 도달한 상태로 계속 스크롤을 아래로 내릴때
    /// 계속 이벤트가 발생하는것을 방지. 즉, 중복되는 이벤트를 삭제 removeDuplicates()
    lazy var isBottom: AnyPublisher<Bool, Never> = $isBottomPosition.removeDuplicates().eraseToAnyPublisher()
    
    init(threshold: CGFloat = 0) {
        self.threshold = threshold
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("ScrollViewHelper scrollViewDidScroll() called / scrollView.contentOffset.y:  \(scrollView.contentOffset.y)")
        
        if scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height < threshold {
            self.isBottomPosition = isScrollBottom(scrollView)
            print("isScrollBottom(scrollView): ", isScrollBottom(scrollView))
        }
    }
    
    fileprivate func isScrollBottom(_ scrollView: UIScrollView) -> Bool {
        return scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height < threshold
    }
    
}
