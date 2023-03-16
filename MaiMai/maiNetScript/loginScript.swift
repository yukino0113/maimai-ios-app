//
//  loginScript.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/16.
//

import Foundation
import WebKit


private var account: String?
private var password: String?

/// Use to get account information from account plist file.
/// File Path : MaiMai/UserData
func loadAccountFile(){
    guard let path = Bundle.main.path(forResource: "Account", ofType: "plist"),
          let xml = FileManager.default.contents(atPath: path),
          let plist = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String: Any] else {
        fatalError("Could not load configuration file")
    }
    account = plist["userID"] as? String
    password = plist["password"] as? String
}


/// Used for logging in to the MaiMai DX Global Version via SegaID.
/// - Parameter webView: The current using WebView
func loginScript(webView: WKWebView){
    
    // Load the account settings first
    loadAccountFile()
    
    // find and scroll to the segaID button and cilck it to show the input box
    webView.evaluateJavaScript(
    """
            var segaIdButton = document.querySelector('.c-button--openid--segaId');
            segaIdButton.scrollIntoView();
            segaIdButton.click();
    """)
    
    // input the account and password
    webView.evaluateJavaScript("document.querySelector('[name=\"sid\"]').value = \"\(account!)\";")
    webView.evaluateJavaScript("document.querySelector('[name=\"password\"]').value = \"\(password!)\";")
    
    // press login
    webView.evaluateJavaScript("document.querySelector('#btnSubmit').click();")
}
