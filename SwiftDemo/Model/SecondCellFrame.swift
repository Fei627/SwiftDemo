//
//  SecondCellFrame.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/3/3.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit

fileprivate let kMarginLeft     = CGFloat.init(10)
fileprivate let kMarginTop      = CGFloat.init(10)
fileprivate let kLeftWidth      = ("期望送达：").sizeOfStringWithFont(font: UIFont.systemFont(ofSize: kTextFont), height:kLeftHeight).width
fileprivate let kLeftHeight     = CGFloat.init(20)
fileprivate let kRightWidth     = CGFloat.init(kScreenWidth - kLeftWidth - (kMarginLeft * 2))
fileprivate let kTextFont       = CGFloat.init(14)


class SecondCellFrame: NSObject {

    // MARK: 属性
    var model : SecondModel?
    
    
    // MARK: getter
    
    var font : UIFont {
        get {
            return UIFont.systemFont(ofSize: kTextFont)
        }
    }
    
    /// 期望送达
    var expectFrame : CGRect? {
        get {
            let x : CGFloat = kMarginLeft
            let y : CGFloat = kMarginTop
            let w : CGFloat = kLeftWidth
            let h : CGFloat = kLeftHeight
            
            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
    var expectLabelFrame : CGRect? {
        get {
            let x : CGFloat = (expectFrame ?? CGRect.zero).maxX
            let y : CGFloat = (expectFrame ?? CGRect.zero).minY
            let w : CGFloat = kRightWidth
            
            let t : CGFloat = (model?.expect?.sizeOfStringWithFont(font: self.font, width: w).height ?? kLeftHeight)
            let h : CGFloat = t > kLeftHeight ? t : kLeftHeight
            
            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
    /// 备注
    var remarkFrame : CGRect? {
        get {
            let x : CGFloat = kMarginLeft
            let y : CGFloat = (expectFrame ?? CGRect.zero).maxY + kMarginTop
            let w : CGFloat = kLeftWidth
            let h : CGFloat = kLeftHeight
            
            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
    var remarkLabelFrame : CGRect? {
        get {
            let x : CGFloat = (remarkFrame ?? CGRect.zero).maxX
            let y : CGFloat = (remarkFrame ?? CGRect.zero).minY
            let w : CGFloat = kRightWidth
            
            let t : CGFloat = (model?.remark?.sizeOfStringWithFont(font: self.font, width: w).height ?? kLeftHeight)
            let h : CGFloat = t > kLeftHeight ? t : kLeftHeight
                        
            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
    /// 下单时间
    var orderTimeFrame : CGRect? {
        get {
            let x : CGFloat = kMarginLeft
            let y : CGFloat = (remarkLabelFrame ?? CGRect.zero).maxY + kMarginTop
            let w : CGFloat = kLeftWidth
            let h : CGFloat = kLeftHeight
            
            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
    var orderTimeLabelFrame : CGRect? {
        get {
            let x : CGFloat = (orderTimeFrame ?? CGRect.zero).maxX
            let y : CGFloat = (orderTimeFrame ?? CGRect.zero).minY
            let w : CGFloat = kRightWidth
            
            let t : CGFloat = (model?.time?.sizeOfStringWithFont(font: self.font, width: w).height ?? kLeftHeight)
            let h : CGFloat = t > kLeftHeight ? t : kLeftHeight

            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }

    /// 订单编号
    var orderNumFrame : CGRect? {
        get {
            let x : CGFloat = kMarginLeft
            let y : CGFloat = (orderTimeLabelFrame ?? CGRect.zero).maxY + kMarginTop
            let w : CGFloat = kLeftWidth
            let h : CGFloat = kLeftHeight
            
            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
    var orderNumLabelFrame : CGRect? {
        get {
            let x : CGFloat = (orderNumFrame ?? CGRect.zero).maxX
            let y : CGFloat = (orderNumFrame ?? CGRect.zero).minY
            let w : CGFloat = kRightWidth
            
            let t : CGFloat = (model?.order_num?.sizeOfStringWithFont(font: self.font, width: w).height ?? kLeftHeight)
            let h : CGFloat = t > kLeftHeight ? t : kLeftHeight
            
            return CGRect.init(x: x, y: y, width: w, height: h)
        }
    }
    
    /// cell高度
    var cellHeight : CGFloat? {
        get {
            let h : CGFloat = (orderNumLabelFrame ?? CGRect.zero).maxY + kMarginTop
            
            return h
        }
    }
    
}
