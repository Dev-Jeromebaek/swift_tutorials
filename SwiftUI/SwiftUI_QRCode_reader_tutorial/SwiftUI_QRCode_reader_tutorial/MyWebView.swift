//
//  MyWebView.swift
//  SwiftUI_QRCode_reader_tutorial
//
//  Created by 백승엽 on 2022/03/16.
//

import SwiftUI
import WebKit

// uikit의 uiview를 사용할 수 있도록 한다.
// UIViewControllerRepresentable
struct MyWebView : UIViewRepresentable {
    
    var urlToLoad: String
    
    // ui view 만들기
    func makeUIView(context: Context) -> WKWebView  {
        
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        let webview = WKWebView()
        
        // 웹뷰를 로드한다.
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
    }
    
}


struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com").edgesIgnoringSafeArea(.all)
    }
}
