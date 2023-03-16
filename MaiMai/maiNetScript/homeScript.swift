//
//  maimaiScript.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/16.
//

import Foundation
import WebKit

func homeScript(webView: WKWebView){
    
    /**
     Used for collecting players data such as playerID, rating, title
     **/
    
    // var userInfo: UserInfo = UserInfo()
    
    
    /**
     - query :
     The Selector of the element to find :
     By ID: ('#idName')
     By Class Name: ('.className')
     By Element type: ('elementType') (e.g. 'div', 'span', 'a', etc.)
     By compound selector: ('element.class') (e.g. 'class1.class2', 'a.external', '.red.bold', etc.)
     By CSS selector: ('selector') (e.g. '#id .class element[attr="value"]', etc.)
     By attribute: ('[attribute="value"]') (e.g. '[name="username"]', '[data-id="123"]', etc.)
     **/
    
    webView.evaluateJavaScript("document.querySelector('.name_block.f_l.f_16').innerText") { (result, error) in
        let name = result as? String
    }
    
    webView.evaluateJavaScript("document.querySelector('[name=\"rating_block\"]').innerText") { (result, error) in
        let rating = result as? String
    }
}
