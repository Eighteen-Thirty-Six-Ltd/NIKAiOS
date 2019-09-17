//
//  Extensions.swift
//  NikaMatch
//
//  Created by Basavaraj on 06/06/19.
//  Copyright © 2019 Basavaraj. All rights reserved.
//

import UIKit

extension UIView {
    
    func addthickWhiteBorderWithCornerRadius(cornerRadius : CGFloat) {
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 4.0
        
    }
    
    func addCornerRadius(cornerRadius : CGFloat) {
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func addNickMatchBorder(borderWodth : CGFloat) {
        
        self.layer.borderColor = UIColor(red: (127.0/255.0), green: (60.0/255.0), blue: (213.0/255.0), alpha: 1.0).cgColor
        self.layer.borderWidth = borderWodth
    }
    
    func addShadow()  {
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 3.0);
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath.cgPath
    }
    
}

extension UIColor {
    
    class func nikeMatchPurpleColor() -> UIColor {
        
        return UIColor(red: (127.0/255.0), green: (60.0/255.0), blue: (213.0/255.0), alpha: 1.0)
    }
    
    class func nikeMatchPurpleColorLessAlpha() -> UIColor {
        
        return UIColor(red: (127.0/255.0), green: (60.0/255.0), blue: (213.0/255.0), alpha: 0.5)
    }
}
