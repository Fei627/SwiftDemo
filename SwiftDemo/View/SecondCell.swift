//
//  SecondCell.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/3/3.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit

let kGrayColor  = UIColor.gray
let kBlackColor = UIColor.black

class SecondCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubviews()
    {
        contentView.addSubview(expect)
        contentView.addSubview(expectLabel)
        
        contentView.addSubview(remark)
        contentView.addSubview(remarkLabel)
        
        contentView.addSubview(orderTime)
        contentView.addSubview(orderTimeLabel)

        contentView.addSubview(orderNum)
        contentView.addSubview(orderNumLabel)
    }
    
    
    // MARK: setter
    
    var frameModel : SecondCellFrame? {
        didSet(newModel) {
            
            print("\(newModel)")
            print("\(frameModel)")
            
            /// 赋值frame
            expect.frame            = (frameModel?.expectFrame ?? CGRect.zero)
            expectLabel.frame       = (frameModel?.expectLabelFrame ?? CGRect.zero)
            
            remark.frame            = (frameModel?.remarkFrame ?? CGRect.zero)
            remarkLabel.frame       = (frameModel?.remarkLabelFrame ?? CGRect.zero)
            
            orderTime.frame         = (frameModel?.orderTimeFrame ?? CGRect.zero)
            orderTimeLabel.frame    = (frameModel?.orderTimeLabelFrame ?? CGRect.zero)
            
            orderNum.frame          = (frameModel?.orderNumFrame ?? CGRect.zero)
            orderNumLabel.frame     = (frameModel?.orderNumLabelFrame ?? CGRect.zero)
            
            /// 赋值字段值
            expectLabel.text = frameModel?.model?.expect
            remarkLabel.text = frameModel?.model?.remark
            orderTimeLabel.text = frameModel?.model?.time
            orderNumLabel.text = frameModel?.model?.order_num            
        }
    }
    
    // MARK: lazy load
    
    fileprivate lazy var expect : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kGrayColor
        label.text = "期望送达："
        
        return label
    }()
    
    lazy var expectLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kBlackColor
        
        return label
    }()
    
    fileprivate lazy var remark : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kGrayColor
        label.text = "订单备注："
        
        return label
    }()
    
    lazy var remarkLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kBlackColor
        label.numberOfLines = 0
        
        return label
    }()
    
    fileprivate lazy var orderTime : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kGrayColor
        label.text = "下单时间:"
        
        return label
    }()
    
    lazy var orderTimeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kGrayColor
        
        return label
    }()
    
    fileprivate lazy var orderNum : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kGrayColor
        label.text = "订单编号："
        
        return label
    }()
    
    lazy var orderNumLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = kGrayColor
        
        return label
    }()
    
}
