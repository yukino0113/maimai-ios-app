//
//  MenuViewController.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/17.
//

import Foundation
import UIKit
import SideMenu

class MenuViewController: UIViewController{
    
    private var sideMenu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "AccentColor")
        menuButtonSetup()
        sideMenuSetup()
        logoSetup()
        titleSetup()
        
    }

    private func logoSetup(){
        
        let logoWidthSize = UIScreen.main.bounds.width / 2
        let logoHeightSize = ceil(logoWidthSize * 0.303)
        
        let logoXFloat = UIScreen.main.bounds.width / 2 - logoWidthSize / 2
        let logoYFloat = UIScreen.main.bounds.height / 8  - logoHeightSize / 2
        
        let logo = UIButton(frame: CGRect(x: logoXFloat, y: logoYFloat, width: logoWidthSize, height: logoHeightSize))
        logo.setImage(UIImage(named: "logo"), for: .normal)
        logo.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        view.addSubview(logo)
    }

    private func menuButtonSetup(){
        let menuButton = UIButton(type: .system)
        menuButton.frame = CGRect(x: 30,
                                  y: 50,
                                  width: UIScreen.main.bounds.width / 8,
                                  height: UIScreen.main.bounds.width / 8)
        menuButton.setImage(UIImage(named: "menuButton"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        view.addSubview(menuButton)
    }
    
    @objc private func menuButtonTapped() {
        present(sideMenu!, animated: true, completion: nil)
    }
    
    private func sideMenuSetup(){
        let sideMenuViewController = SideMenuViewController()
        sideMenu = SideMenuNavigationController(rootViewController: sideMenuViewController)
        sideMenu?.leftSide = true
        sideMenu?.presentationStyle = .menuSlideIn
    }
    
    private func titleSetup(){
        let titleFrameWidthSize = UIScreen.main.bounds.width * 0.64
        let titleFrameHeightSize = titleFrameWidthSize * 0.093
        
        let titleFrameXFloat = 100.0
        let titleFrameYFloat = 300.0
        
        let titleFrame = UIButton(type: .custom)
        titleFrame.frame = CGRect(x: titleFrameXFloat,
                                  y: titleFrameYFloat,
                                  width: titleFrameWidthSize,
                                  height: titleFrameHeightSize)
        titleFrame.setImage(UIImage(
            named:  "trophy" + readValueFromPlist(forKey: "titleColor")!.capitalized),
            for: .normal)
        
        titleFrame.imageView?.contentMode = .scaleAspectFit
        titleFrame.contentHorizontalAlignment = .fill
        titleFrame.contentVerticalAlignment = .fill
        
        view.addSubview(titleFrame)
        
        let titleWidthSize = UIScreen.main.bounds.width * 0.64
        let titleHeightSize = titleFrameWidthSize * 0.093
        
        let titleXFloat = 140.0
        let titleYFloat = 300.0
        
        let title = UILabel(frame: CGRect(x: titleXFloat,
                                          y: titleYFloat,
                                          width: titleWidthSize,
                                          height: titleHeightSize))
        title.text = readValueFromPlist(forKey: "title")
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.addSubview(title)
    }
    
    public func readValueFromPlist(forKey key: String) -> String? {
        if let plistPath = Bundle.main.path(forResource: "userInfo", ofType: "plist"),
           let plistData = FileManager.default.contents(atPath: plistPath),
           let plistDict = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: AnyObject],
           let value = plistDict[key] as? String {
            return value
        }
        return nil
    }
}


