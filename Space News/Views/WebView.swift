//
//  WebView.swift
//  Space News
//
//  Created by Jade Kim on 5/12/20.
//  Copyright © 2020 Jade Kim. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
