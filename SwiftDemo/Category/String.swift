//
//  String.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/3/3.
//  Copyright © 2017年 user1. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    public func sizeOfStringWithFont(font: UIFont, width: CGFloat) -> CGSize {
        
        let tempLable = UILabel()
        tempLable.frame = CGRect.init(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude)
        tempLable.font = font
        tempLable.numberOfLines = 0;
        tempLable.text = self;
        tempLable.sizeToFit()
        
        return tempLable.bounds.size;
    }
    
    
    public func sizeOfStringWithFont(font: UIFont, height: CGFloat) -> CGSize {
        
        let tempLable = UILabel()
        tempLable.frame = CGRect.init(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height)
        tempLable.font = font
        tempLable.numberOfLines = 0;
        tempLable.text = self;
        tempLable.sizeToFit()
        
        return tempLable.bounds.size;
    }
    
}
