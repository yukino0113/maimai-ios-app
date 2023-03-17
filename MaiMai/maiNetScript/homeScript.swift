//
//  maimaiScript.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/16.
//

import Foundation
import WebKit


/// A class use to handle script running on home page
class homeScript: NSObject, WKNavigationDelegate{
    
    var webView = WKWebView()
    
    init(webView: WKWebView){
        self.webView = webView
    }
    
    
    /// The function use to run all the script on home page
    func runHomeScript(){
        self.getAndSavePlayerID()
        self.getAndSaveRating()
        self.getAndSaveRatingColor()
        self.getAndSaveTitle()
        self.getAndSaveTitleColor()
    }
    
    
    /// Use to read plist file and write into the plist file
    /// - Parameters:
    ///   - key: the name of the attribute
    ///   - value: the value of the attribute
    /// - Throws: Failed to write / load the plist file
    private func writeValueToPlistFile(forKey key:String, value: String) throws {
        guard var dictionary = NSDictionary(contentsOfFile: "userData/userInfo") as? [String:String] else{
            throw NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to load plist file"])
        }
        dictionary[key] = value
        let nsDictionary = NSDictionary(dictionary: dictionary)
        if !nsDictionary.write(toFile: "userData/userInfo", atomically: true) {
            throw NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to write to plist file"])
        }
    }
    
    
    /// Function use to get and save playerID to Plist file
    private func getAndSavePlayerID(){
        self.webView.evaluateJavaScript("document.querySelector('.name_block.f_l.f_16').innerText") { (result, error) in
            let title = result as? String
            try? self.writeValueToPlistFile(forKey: "title", value: title!)
        }
    }
    
    /// Function use to get and save title to Plist file
    private func getAndSaveTitle(){
        self.webView.evaluateJavaScript("document.querySelector('.trophy_inner_block.f_13').innerText") { (result, error) in
            let title = result as? String
            try? self.writeValueToPlistFile(forKey: "title", value: title!)
        }
    }
    
    /// Function use to get and save title color to Plist file
    private func getAndSaveTitleColor(){
        self.webView.evaluateJavaScript("document.querySelector('.p_3.t_c.f_0').getAttribute('class')") { (result, error) in
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
            
            try? self.writeValueToPlistFile(forKey: "titleColor", value: color)
        }
    }
    
    /// Function use to get and save rating to Plist file
    private func getAndSaveRating(){
        
    }
    
    /// Function use to get and save rating color to Plist file
    private func getAndSaveRatingColor(){
        self.webView.evaluateJavaScript("document.querySelector('.h_30.f_r').getAttribute('src')"){ (result, error) in
            if let url = result as? String,
               let range = url.range(of: "rating_base_(.*?)\\.png", options: .regularExpression) {
                let color = String(url[range].dropFirst("rating_base_".count).dropLast(".png".count))
                try? self.writeValueToPlistFile(forKey: "rating", value: color)
            }
        }
    }
    
    private func getAndSaveDan(){
        
    }
    
    private func getAndSaveGrade(){
        
    }
    
}


/*
     - query :
     The Selector of the element to find :
     By ID: ('#idName')
     By Class Name: ('.className')
     By Element type: ('elementType') (e.g. 'div', 'span', 'a', etc.)
     By compound selector: ('element.class') (e.g. 'class1.class2', 'a.external', '.red.bold', etc.)
     By CSS selector: ('selector') (e.g. '#id .class element[attr="value"]', etc.)
     By attribute: ('[attribute="value"]') (e.g. '[name="username"]', '[data-id="123"]', etc.)
*/
