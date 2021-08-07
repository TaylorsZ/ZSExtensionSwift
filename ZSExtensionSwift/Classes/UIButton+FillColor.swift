//
//  UIButton+FillColor.swift
//  Poppy
//
//  Created by Taylor on 2020/4/17.
//  Copyright © 2020 Taylor. All rights reserved.
//

import Foundation
import UIKit

//var titleNameKey = 100
extension UIButton {
    
    /// 设置背景色
    /// - Parameters:
    ///   - color: 背景颜色
    ///   - state: 状态
    public func setBackgroundColor(color:UIColor , state:UIControl.State) {
        if let image = image(color) {
            self.setBackgroundImage(image, for: state)
        }
      
    }
    private func image(_ color:UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
