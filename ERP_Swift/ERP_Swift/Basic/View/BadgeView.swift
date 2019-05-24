//
//  BadgeView.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/20.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

enum BadgeViewAlignment {
    case TopLeft
    case TopRight
    case TopCenter
    case CenterLeft
    case CenterRight
    case BottomLeft
    case BottomRight
    case BottomCenter
    case Center
}

private let BadgeViewShadowRadius = 0.0
private let BadgeViewHeight = 18.0
private let BadgeViewTextSideMargin = 9.0
private let BadgeViewCornerRadius = 10.0

class BadgeView: UIView {

    var badgeText: String {
        get {
            return self.badgeText
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    var badgeAlignment: BadgeViewAlignment {
        get {
            return self.badgeAlignment
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    var badgeTextColor: UIColor {
        get {
            return self.badgeTextColor
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    var badgeTextShadowOffset: CGSize {
        get {
            return self.badgeTextShadowOffset
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    var badgeTextShadowColor: UIColor {
        get {
            return self.badgeTextShadowColor
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    var badgeTextFont: UIFont {
        get {
            return self.badgeTextFont
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    var badgeBackgroundColor: UIColor {
        get {
            return self.badgeBackgroundColor
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// Color of the overlay circle at the top. Default is semi-transparent white.
    var badgeOverlayColor: UIColor {
        get {
            return self.badgeOverlayColor
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// Color of the badge shadow. Default is semi-transparent black.
    var badgeShadowColor: UIColor {
        get {
            return self.badgeShadowColor
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// Offset of the badge shadow. Default is 3.0 points down.
    var badgeShadowSize: CGSize {
        get {
            return self.badgeShadowSize
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// Width of the circle around the badge. Default is 2.0 points.
    var badgeStrokeWidth: CGFloat {
        get {
            return self.badgeStrokeWidth
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// Color of the circle around the badge. Default is white.
    var badgeStrokeColor: UIColor {
        get {
            return self.badgeStrokeColor
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// Allows to shift the badge by x and y points.
    var badgePositionAdjustment: CGPoint {
        get {
            return self.badgePositionAdjustment
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// You can use this to position the view if you're drawing it using drawRect instead of `-addSubview:` (optional) If not provided, the superview frame is used.
    var frameToPositionInRelationWith: CGRect {
        get {
            return self.frameToPositionInRelationWith
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    /// The minimum width of a badge circle. We need this to avoid elipse shapes when using small fonts.
    var badgeMinWidth: CGFloat {
        get {
            return self.badgeMinWidth
        }
        set(newValue) {
            self.setNeedsLayout()
        }
    }
    
    func initWithParentView(_ parentView : UIView, _ alignment : BadgeViewAlignment) -> Any {
        
        self.badgeAlignment = alignment
        parentView .addSubview(self)
        return self
    }

}
