//
//  ProfileHelper.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/18.
//

import Foundation
import UIKit

class ProfileHealper{
    
    private let view: UIView
    
    let profileWidth = UIScreen.main.bounds.width * 0.9
    let profileHeight = UIScreen.main.bounds.height * 0.13
    
    private var profileXFloat: CGFloat{
        return (UIScreen.main.bounds.width - profileWidth) / 2
    }
    
    private var profileYFloat: CGFloat{
        return (UIScreen.main.bounds.height / 8 * 3) - profileHeight
    }
        
        init(view: UIView) {
            self.view = view
        }
    
    func runSetup(){
        profileBlock()
        titleFrame()
        icon()
        rating()
        name()
    }
    
    private func profileBlock(){
        let frameShadow = UIView(frame: CGRect(x: profileXFloat + 1,
                                               y: profileYFloat + 3,
                                               width: profileWidth,
                                               height: profileHeight))
        frameShadow.backgroundColor = .gray
        frameShadow.layer.cornerRadius = 5
        view.addSubview(frameShadow)

        let frame = UIView(frame: CGRect(x: profileXFloat,
                                         y: profileYFloat,
                                         width: profileWidth,
                                         height: profileHeight))
        frame.backgroundColor = .white
        frame.layer.cornerRadius = 5
        view.addSubview(frame)
    }
    
    private func icon(){
        
        let iconSize = profileHeight * 0.9
        
        let iconYFloat = profileYFloat + (profileHeight - iconSize) / 2
        let iconXFloat = profileXFloat + (profileHeight - iconSize) / 2
        
        let icon = UIButton(frame: CGRect(x: iconXFloat, y: iconYFloat, width: iconSize, height: iconSize))
        icon.setImage(UIImage(named: "icon"), for: .normal)
        view.addSubview(icon)
        
    }
    
    private func titleFrame(){
        let titleFrameWidthSize = profileWidth * 0.6
        let titleFrameHeightSize = profileHeight * 0.2
        
        let titleFrameXFloat = profileXFloat + profileHeight
        let titleFrameYFloat = profileYFloat + (profileHeight - profileHeight * 0.9) / 2
        
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

        let titleWidthSize = titleFrameWidthSize * 5
        let titleHeightSize = titleFrameHeightSize
        
        let titleXFloat = titleFrameXFloat
        let titleYFloat = titleFrameYFloat
        
        let title = UILabel(frame: CGRect(x: titleXFloat,
                                          y: titleYFloat,
                                          width: titleWidthSize,
                                          height: titleHeightSize))
        
        title.text = readValueFromPlist(forKey: "title")
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        title.textColor = UIColor.white
        title.sizeToFit()
        title.center = view.center

        view.addSubview(title)
    }
    
    private func name(){
        
        let nameFrameWidthSize = profileWidth * 0.36
        let nameFrameHeightSize = profileHeight * 0.2
        
        let nameFrameXFloat = profileXFloat + profileHeight
        let nameFrameYFloat = profileYFloat + profileHeight * 0.3
        
        let NameframeShadow = UIView(frame: CGRect(x: nameFrameXFloat + 1,
                                               y: nameFrameYFloat + 3,
                                               width: nameFrameWidthSize,
                                               height: nameFrameHeightSize))
        NameframeShadow.backgroundColor = .gray
        NameframeShadow.layer.cornerRadius = 5
        view.addSubview(NameframeShadow)
        
        let nameFrame = UIView(frame: CGRect(x: nameFrameXFloat,
                                             y: nameFrameYFloat,
                                         width: nameFrameWidthSize,
                                         height: nameFrameHeightSize))
        nameFrame.backgroundColor = .white
        nameFrame.layer.cornerRadius = 5
        nameFrame.layer.borderWidth = 1
        nameFrame.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(nameFrame)
        
        
    }
    
    private func rating(){
        
        let ratingFrameWidthSize = profileWidth * 0.35 / 1.4
        let ratingFrameHeightSize = profileHeight * 0.25
        
        let ratingFrameXFloat = profileXFloat + profileHeight * 1.08 + profileWidth * 0.36
        let ratingFrameYFloat = profileYFloat + profileHeight * 0.29
        
        let ratingFrame = UIButton(type: .custom)
        ratingFrame.frame = CGRect(x: ratingFrameXFloat,
                                  y: ratingFrameYFloat,
                                  width: ratingFrameWidthSize,
                                  height: ratingFrameHeightSize)
        ratingFrame.setImage(UIImage(
            named:  "rating" + readValueFromPlist(forKey: "ratingColor")!.capitalized),
            for: .normal)
        
        view.addSubview(ratingFrame)
        
        let ratingWidthSize = UIScreen.main.bounds.width * 0.64
        let ratingHeightSize = ratingWidthSize * 0.093
        
        let ratingXFloat = profileXFloat + profileHeight * 1.08 + profileWidth * 0.36
        let ratingYFloat = profileYFloat + profileHeight * 0.29
        
        let rating = UILabel(frame: CGRect(x: ratingXFloat,
                                          y: ratingYFloat,
                                          width: ratingWidthSize,
                                          height: ratingHeightSize))
        rating.text = readValueFromPlist(forKey: "rating")
        rating.textColor = .white
        rating.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(rating)
    }
    
}
