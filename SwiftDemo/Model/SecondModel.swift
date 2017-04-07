//
//  SecondModel.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/3/3.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit

class SecondModel: NSObject {
    
    // MARK: 属性
    
    /// 期望送达
    var expect : String?
    
    /// 备注
    var remark : String?
    
    /// 下单时间
    var time : String?
    
    /// 订单编号
    var order_num : String?
    
    /// number 基本数据类型，必须赋一个初始值
    var number : Int = 0
}
