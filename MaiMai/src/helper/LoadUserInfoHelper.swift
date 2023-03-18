//
//  LoadUserInfoHelper.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/18.
//

import Foundation

func readValueFromPlist(forKey key: String) -> String? {
    if let plistPath = Bundle.main.path(forResource: "userInfo", ofType: "plist"),
       let plistData = FileManager.default.contents(atPath: plistPath),
       let plistDict = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: AnyObject],
       let value = plistDict[key] as? String {
        return value
    }
    return nil
}
