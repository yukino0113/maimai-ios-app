//
//  maimaiScript.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/16.
//

import Foundation
import WebKit

/// Use to read plist file and write into the plist file
/// - Parameters:
///   - key: the name of the attribute
///   - value: the value of the attribute
/// - Throws: Failed to write / load the plist file
func writeValueToPlistFile(forKey key:String, value: String) throws {
    guard var dictionary = NSDictionary(contentsOfFile: "userData/userInfo") as? [String:String] else{
        throw NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load plist file"])
    }
    dictionary[key] = value
    let nsDictionary = NSDictionary(dictionary: dictionary)
    if !nsDictionary.write(toFile: "userData/userInfo", atomically: true) {
        throw NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to write to plist file"])
    }
}


/// Used for collecting players data such as playerID, rating, title
/// - Parameter webView: The currently used webView
func homeScript(webView: WKWebView){
    
    /**
     - query :
     The Selector of the element to find :
     By ID: ('#idName')
     By Class Name: ('.className')
     By Element type: ('elementType') (e.g. 'div', 'span', 'a', etc.)
     By compound selector: ('element.class') (e.g. 'class1.class2', 'a.external', '.red.bold', etc.)
     By CSS selector: ('selector') (e.g. '#id .class element[attr="value"]', etc.)
     By attribute: ('[attribute="value"]') (e.g. '[name="username"]', '[data-id="123"]', etc.)
     */
    
    
    webView.evaluateJavaScript("document.querySelector('.name_block.f_l.f_16').innerText") { (result, error) in
        let name = result as? String
        try? writeValueToPlistFile(forKey: "playerID", value: name!)
    }
    
    webView.evaluateJavaScript("document.querySelector('.trophy_inner_block.f_13').innerText") { (result, error) in
        let title = result as? String
        try? writeValueToPlistFile(forKey: "title", value: title!)
    }
    
    webView.evaluateJavaScript("document.querySelector('.p_3.t_c.f_0').getAttribute('class')") { (result, error) in
        guard let titleColor = result as? String else { return }
        let color: String
        
        switch true {
        case titleColor.contains("Normal"):
            color = "white"
        case titleColor.contains("Bronze"):
            color = "bronze"
        case titleColor.contains("Silver"):
            color = "silver"
        case titleColor.contains("Gold"):
            color = "gold"
        default:
            color = "rainbow"
        }
        
        try? writeValueToPlistFile(forKey: "titleColor", value: color)
    }

    
    webView.evaluateJavaScript("document.querySelector('.h_30.f_r').getAttribute('src')"){ (result, error) in
        if let url = result as? String,
           let range = url.range(of: "rating_base_(.*?)\\.png", options: .regularExpression) {
            let color = String(url[range].dropFirst("rating_base_".count).dropLast(".png".count))
            try? writeValueToPlistFile(forKey: "rating", value: color)
        }
    }
    
    
        /**
        - ToDo:
         dan
         grade
         */
        
}
