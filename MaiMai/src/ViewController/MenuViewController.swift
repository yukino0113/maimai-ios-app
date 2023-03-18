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
        ProfileHealper(view: view).runSetup()
        
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
}


