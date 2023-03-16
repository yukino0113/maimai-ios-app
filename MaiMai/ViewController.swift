//
//  ViewController.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/14.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    // let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // webView = WKWebView(frame: .zero, configuration: configuration)
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        webView.load(URLRequest(url: URL(string: "https://maimaidx-eng.com/maimai-mobile/home/")!))
    }
    

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        let url = webView.url!.absoluteString
        
        if !webView.isLoading{
            
            if url.contains("https://lng-tgk-aime-gw.am-all.net"){
                loginScript(webView: webView)
                
            }else if (url == "https://maimaidx-eng.com/maimai-mobile/home/"){
                homeScript(webView: webView).runHomeScript()
            }
        }
    }
        

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Website failed to load: \(error.localizedDescription)")
    }
}
