//
//  ViewController.swift
//  WKWebViewTest
//
//  Created by Ranjeet Sah on 08/05/18.
//  Copyright © 2018 Ranjeet Sah. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var webViewContainer: UIView!
    
    override func viewDidLoad() {
        
        
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        webViewContainer.addSubview(webView)
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        webViewContainer.addSubview(activityIndicator)
        
        webView.load(URLRequest(url: URL(string: "http://www.google.com")!))
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}

