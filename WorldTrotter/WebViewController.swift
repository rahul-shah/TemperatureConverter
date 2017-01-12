//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Rahul Shah on 12/29/16.
//  Copyright © 2016 Rahul Shah. All rights reserved.
//

import UIKit
import WebKit

class WebViewController : UIViewController
{
    var webView : WKWebView!
    
    override func viewDidLoad() {
        
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.load(URLRequest.init(url: URL.init(string: "https://www.bignerdranch.com")!))
        
        view = webView
    }
}
