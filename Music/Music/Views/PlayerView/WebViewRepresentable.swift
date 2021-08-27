//
//  WebViewRepresentable.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import Foundation
import SwiftUI
import UIKit
import WebKit

struct WebView: UIViewRepresentable {
    
    let url : URL
 

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: CGRect(origin: .zero, size: CGSize(width: 400, height: 200)))
        webView.backgroundColor = .clear
       return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }
    
    
}
