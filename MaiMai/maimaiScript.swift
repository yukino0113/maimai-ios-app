//
//  maimaiScript.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/16.
//

import Foundation
import WebKit

func loginScript(webView: WKWebView){
    webView.evaluateJavaScript(
    """
            var segaIdButton = document.querySelector('.c-button--openid--segaId');
            segaIdButton.scrollIntoView();
            segaIdButton.click();
    
            var accountInput = document.querySelector('[name="sid"]');
            accountInput.value = "123";
                            
            var passwordInput = document.querySelector('[name="password"]');
            passwordInput.value = "123";
        
            var loginPress = document.querySelector('#btnSubmit');
            loginPress.click();
    """
    )
}

func homeScript(webView: WKWebView){
    
    var userInfo: UserInfo = UserInfo()
    
    func evaluateJSString(query: String, completionHandler: @escaping (String?) -> Void) {
        webView.evaluateJavaScript("document.querySelector('\(query)').innerText") { (result, error) in
            if let text = result as? String {
                completionHandler(text)
            }
        }
    }
    
    evaluateJSString(query: ".name_block.f_l.f_16") { (result) in
        let name = result
        print(name!)
    }
    
    evaluateJSString(query: "[name=\"rating_block\"]") { (result) in
        let rating = result
        print(rating!)
    }
}
