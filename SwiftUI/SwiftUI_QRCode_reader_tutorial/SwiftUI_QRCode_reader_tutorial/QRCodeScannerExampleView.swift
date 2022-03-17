//
//  QRCodeScannerExampleView.swift
//  SwiftUI_QRCode_reader_tutorial
//
//  Created by 백승엽 on 2022/03/16.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?

    var body: some View {
        ZStack {
            if let code = scannedCode {
                MyWebView(urlToLoad: code)
            } else {
                MyWebView(urlToLoad: "https://www.naver.com")
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    self.isPresentingScanner = true
                }) {
                    Text("Scan Code")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 5)
                        )
                }
                .sheet(isPresented: $isPresentingScanner) {
                    CodeScannerView(codeTypes: [.qr]) { response in
                        if case let .success(result) = response {
                            scannedCode = result.string
                            isPresentingScanner = false
                        }
                    }
                }
                Spacer().frame(height: 30)
            } // VStack
        } // ZStack
    }
}

struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}
