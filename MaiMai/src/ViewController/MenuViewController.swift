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
    private let profileXFloat = (UIScreen.main.bounds.width - profileWidth) / 2
    private let profileYFloat = (UIScreen.main.bounds.height / 8 * 3) - profileHeight
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "AccentColor")
        menuButtonSetup()
        sideMenuSetup()
        logoSetup()
        profileFrame()
        titleSetup()
        ratingSetup()
        
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
    
    private func profileFrame(){
        
        let profileWidth = UIScreen.main.bounds.width * 0.9
        let profileHeight = UIScreen.main.bounds.height * 0.13
        
        let frameShadow = UIView(frame: CGRect(x: profileXFloat + 1,
                                               y: profileYFloat + 3,
                                               width: profileWidth,
                                               height: profileHeight))
        frameShadow.backgroundColor = .gray
        frameShadow.layer.cornerRadius = 5
        
        let frame = UIView(frame: CGRect(x: profileXFloat,
                                         y: profileYFloat,
                                         width: profileWidth,
                                         height: profileHeight))
        frame.backgroundColor = .white
        frame.layer.cornerRadius = 5
        

        view.addSubview(frameShadow)
        view.addSubview(frame)
    }
    
    private func iconSetup(){
        
        let profileWidth = UIScreen.main.bounds.width * 0.9
        let profileHeight = UIScreen.main.bounds.height * 0.13
        
        let profileXFloat = (UIScreen.main.bounds.width - profileWidth) / 2
        let profileYFloat = (UIScreen.main.bounds.height / 8 * 3) - profileHeight
        
    }
    
    private func titleSetup(){
        
        // 296 * 86
        
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
    
    private func ratingSetup(){
        let ratingFrameWidthSize = UIScreen.main.bounds.width * 0.64
        let ratingFrameHeightSize = ratingFrameWidthSize * 0.093
        
        let ratingFrameXFloat = 100.0
        let ratingFrameYFloat = 500.0
        
        let ratingFrame = UIButton(type: .custom)
        ratingFrame.frame = CGRect(x: ratingFrameXFloat,
                                  y: ratingFrameYFloat,
                                  width: ratingFrameWidthSize,
                                  height: ratingFrameHeightSize)
        ratingFrame.setImage(UIImage(
            named:  "rating" + readValueFromPlist(forKey: "ratingColor")!.capitalized),
            for: .normal)
        
        ratingFrame.imageView?.contentMode = .scaleAspectFit
        ratingFrame.contentHorizontalAlignment = .fill
        ratingFrame.contentVerticalAlignment = .fill
        
        view.addSubview(ratingFrame)
        
        let ratingWidthSize = UIScreen.main.bounds.width * 0.64
        let ratingHeightSize = ratingWidthSize * 0.093
        
        let ratingXFloat = 140.0
        let ratingYFloat = 500.0
        
        let rating = UILabel(frame: CGRect(x: ratingXFloat,
                                          y: ratingYFloat,
                                          width: ratingWidthSize,
                                          height: ratingHeightSize))
        rating.text = readValueFromPlist(forKey: "rating")
        rating.textColor = .white
        rating.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(rating)
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


