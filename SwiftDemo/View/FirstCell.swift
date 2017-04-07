//
//  FirstCell.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/2/10.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit


class FirstCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubViews() {
        
        self.contentView.addSubview(iconImgView)
        self.contentView.addSubview(nickNameLabel)
        self.contentView.addSubview(signLabel)
        self.contentView.addSubview(lineView)
    }
    
    
    // MARK: 懒加载
    private lazy var iconImgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "baike.jpg")
        img.frame = CGRect.init(x: 5, y: 10, width: 40, height: 40)
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 20
        
        return img
    }()
    
    lazy var nickNameLabel: UILabel = {
        let name = UILabel.init()
        name.frame = CGRect.init(x: 50, y: 5, width: 250, height: 20)
        name.font = UIFont.systemFont(ofSize: 14)
        name.text = "王大锤"
        
        return name
    }()
    
    private lazy var signLabel: UILabel = {
        let sign = UILabel.init()
        sign.frame = CGRect.init(x: 50, y: 35, width: 250, height: 20)
        sign.font = UIFont.systemFont(ofSize: 14)
        sign.text = "大家好，我是万万没想到的男一号"
        
        return sign
    }()
    
    private lazy var lineView: UIView = {
        let line = UIView.init()
        line.frame = CGRect.init(x: 0, y: 59.5, width: kScreenWidth, height: 0.5)
        line.backgroundColor = UIColor.gray
        
        return line
    }()
}
