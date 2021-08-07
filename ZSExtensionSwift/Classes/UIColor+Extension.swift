//
//  UIColor+Extension.swift
//  Poppy
//
//  Created by Taylor on 2020/8/18.
//  Copyright © 2020 Taylor. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 背景颜色
    open class var backgroundGray: UIColor {
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (collection) -> UIColor in
                    if (collection.userInterfaceStyle == .dark) {
                        return UIColor.sameRGB(value: 95);
                    }else{
                        return UIColor.sameRGB(value: 220);
                    }
                }
            } else {
                return UIColor.sameRGB(value: 220);
            }
        }
    }
    /// 背景颜色
    open class var backgroundWhite: UIColor {
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (collection) -> UIColor in
                    if (collection.userInterfaceStyle == .dark) {
                        return UIColor.sameRGB(value: 30);
                    }else{
                        return UIColor.sameRGB(value: 255);
                    }
                }
            } else {
                return UIColor.sameRGB(value: 255);
            }
        }
    }
    /// 文本颜色
    open class var line: UIColor {
        get{
            if #available(iOS 13.0, *) {
                return UIColor { (collection) -> UIColor in
                    if (collection.userInterfaceStyle == .dark) {
                        return UIColor.sameRGB(value: 45);
                    }else{
                        return UIColor.sameRGB(value: 230);
                    }
                }
            } else {
                return UIColor.sameRGB(value: 230);
            }
        }
    }
    /// 生成相同RGB的颜色
    /// - Parameters:
    ///   - value: 数值（0~255）
    ///   - alpha: 透明度
    /// - Returns: 颜色
    public static func sameRGB(value: CGFloat,alpha:CGFloat? = nil) -> UIColor {
        let rgb = value/255.0
        return UIColor(red: rgb, green: rgb, blue: rgb, alpha: alpha ?? 1)
    }
    /// 十六进制颜色
    /// - Parameters:
    ///   - hexColor: 颜色
    ///   - alpha: 透明度
    public convenience init(hexColor: String,alpha:CGFloat? = nil) {
        let hexString = hexColor.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha ?? 1)
    }
    /// 返回随机颜色
    open class var randomWithAlpha:UIColor{
        get
        {
            let r = CGFloat.random(in: 0...1)
            let g = CGFloat.random(in: 0...1)
            let b = CGFloat.random(in: 0...1)
            let a = CGFloat.random(in: 0...1)
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
    }
    /// 返回随机颜色
    open class var random:UIColor{
        get
        {
            let r = CGFloat.random(in: 0...1)
            let g = CGFloat.random(in: 0...1)
            let b = CGFloat.random(in: 0...1)
            return UIColor(red: r, green: g, blue: b, alpha: 1)
        }
    }
}
