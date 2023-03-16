//
//  loginScript.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/16.
//

import Foundation

import WebKit

func loginScript(webView: WKWebView){
    
    /**
    Used for logging in to the MaiMai DX Global Version via SegaID.
     
     - Parameters:
        webView: the current using WebView
     
    **/
    
    // find and scroll to the segaID button and cilck it to show the input box
    webView.evaluateJavaScript(
    """
            var segaIdButton = document.querySelector('.c-button--openid--segaId');
            segaIdButton.scrollIntoView();
            segaIdButton.click();
    """)
    
    // input the account and password
    webView.evaluateJavaScript(
    """
            var accountInput = document.querySelector('[name="sid"]');
            accountInput.value = "123";
                            
            var passwordInput = document.querySelector('[name="password"]');
            passwordInput.value = "123";
    """)
    
    // press login
    webView.evaluateJavaScript(
    """
            var loginPress = document
            loginPress.click();
    """
    )
}
