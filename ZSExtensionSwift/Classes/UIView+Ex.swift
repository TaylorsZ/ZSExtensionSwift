//
//  UIView+Ex.swift
//  HuaiYin
//
//  Created by Taylor on 2021/7/20.
//

import Foundation
import UIKit

enum Direction {
    case top
    case left
    case bottom
    case right
}

extension UIView {
    
    /// 尺寸
    var size: CGSize {
        get {
            return self.frame.size
        }
        set(newValue) {
            self.frame.size = CGSize(width: newValue.width, height: newValue.height)
        }
    }
    
    /// 宽度
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newValue) {
            self.frame.size.width = newValue
        }
    }
    
    /// 高度
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newValue) {
            self.frame.size.height = newValue
        }
    }
    
    /// 横坐标
    var x: CGFloat {
        get {
            return self.frame.minX
        }
        set(newValue) {
            self.frame = CGRect(x: newValue, y: y, width: width, height: height)
        }
    }
    
    /// 纵坐标
    var y: CGFloat {
        get {
            return self.frame.minY
        }
        set(newValue) {
            self.frame = CGRect(x: x, y: newValue, width: width, height: height)
        }
    }
    
    /// 右端横坐标
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set(newValue) {
            frame.origin.x = newValue - frame.size.width
        }
    }
    
    /// 底端纵坐标
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set(newValue) {
            frame.origin.y = newValue - frame.size.height
        }
    }
    
    /// 中心横坐标
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set(newValue) {
            center.x = newValue
        }
    }
    
    /// 中心纵坐标
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            center.y = newValue
        }
    }
    /// 原点
    var origin: CGPoint {
        get {
            return frame.origin;
        }
        set(newValue) {
            
            frame.origin = newValue
        }
    }
    
    /// 右上角坐标
    var topRight: CGPoint {
        get {
            return CGPoint(x: frame.origin.x + frame.size.width, y: frame.origin.y)
        }
        set(newValue) {
            frame.origin = CGPoint(x: newValue.x - width, y: newValue.y)
        }
    }
    
    /// 右下角坐标
    var bottomRight: CGPoint {
        get {
            return CGPoint(x: frame.origin.x + frame.size.width, y: frame.origin.y + frame.size.height)
        }
        set(newValue) {
            frame.origin = CGPoint(x: newValue.x - width, y: newValue.y - height)
        }
    }
    
    /// 左下角坐标
    var bottomLeft: CGPoint {
        get {
            return CGPoint(x: frame.origin.x, y: frame.origin.y + frame.size.height)
        }
        set(newValue) {
            frame.origin = CGPoint(x: newValue.x, y: newValue.y - height)
        }
    }
    
    /// 获取UIView对象某个方向缩进指定距离后的方形区域
    ///
    /// - Parameters:
    ///   - direction: 要缩进的方向
    ///   - distance: 缩进的距离
    /// - Returns: 得到的区域
    func cutRect(direction: Direction, distance: CGFloat) ->  CGRect {
        switch direction {
        case .top:
            return CGRect(x: 0, y: distance, width: self.width, height: self.height - distance)
        case .left:
            return CGRect(x: distance, y: 0, width: self.width - distance, height: self.height)
        case .right:
            return CGRect(x: 0, y: 0, width: self.width - distance, height: self.height)
        case .bottom:
            return CGRect(x: 0, y: 0, width: self.width, height: self.height - distance)
        }
    }
    /// 切圆角处理操作
    ///
    /// - Parameters:
    ///   - corners: UIRectCorner 传递枚举数组 [] 例如： [UIRectCorner.topRight, .topLeft]
    ///   - cornerRadii: CGSize 类型
    func clickCorner(corners: UIRectCorner, cornerRadius: CGFloat) {
        
        let cornerRadii = CGSize.init(width: cornerRadius, height: cornerRadius)
        let maskBezier = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height), byRoundingCorners: corners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = CGRect.init(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        maskLayer.path = maskBezier.cgPath
        layer.mask = maskLayer
    }
    
    func setCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func addShadow(offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        if let r = cornerRadius {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: r).cgPath
        }
    }
    
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    
    func addBorderTop(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
    }
    
    //TODO: add to readme
    /// SugarSwiftExtensions
    func addBorderTop(size: CGFloat, color: UIColor, padding: CGFloat) {
        addBorderUtility(x: padding, y: 0, width: frame.width - padding*2, height: size, color: color)
    }
    
    /// SugarSwiftExtensions
    func addBorderBottom(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
    }
    
    /// SugarSwiftExtensions
    func addBorderLeft(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    
    /// SugarSwiftExtensions
    func addBorderRight(size: CGFloat, color: UIColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
    
    /// SugarSwiftExtensions
    func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
    //TODO: add this to readme
    /// SugarSwiftExtensions
    func drawCircle(fillColor: UIColor, strokeColor: UIColor, strokeWidth: CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.width, height: bounds.size.width), cornerRadius: bounds.size.width/2)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = strokeWidth
        layer.addSublayer(shapeLayer)
    }
    //TODO: add this to readme
    /// SugarSwiftExtensions
    func drawStroke(width: CGFloat, color: UIColor) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.width), cornerRadius: bounds.size.width/2)
        let shapeLayer = CAShapeLayer ()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        layer.addSublayer(shapeLayer)
    }
}


extension UIPageViewController {
    var isPagingEnabled: Bool {
        get {
            var isEnabled: Bool = true
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    isEnabled = subView.isScrollEnabled
                }
            }
            return isEnabled
        }
        set {
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    subView.isScrollEnabled = newValue
                }
            }
        }
    }
}
