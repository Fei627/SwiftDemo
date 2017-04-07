//
//  ViewController.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/2/8.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        
        setSubviews()
    }
    
    func setSubviews()
    {
        titleView.addSubview(leftBtn)
        titleView.addSubview(rightBtn)
        self.navigationItem.titleView = titleView
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    func pushNext()
    {
        let homeVC = HomeViewController();
        self.navigationController?.pushViewController(homeVC, animated: true);
    }
    
    func showNewOrder(btn: UIButton)
    {
        print("\("新订单")")
        
        _ = JLBTimePopView.showPopView(delegate: self as JLBTimePopViewDelegate)
    }
    
    func showReservationOrder(btn: UIButton)
    {
        print("\("预定单")")
        
        _ = JLBTimePopView.showPopView(delegate: self, startDate: "2015-01-01", endDate: "2017-03-03")
    }
    
    // MARK: lazy load
    fileprivate lazy var titleView : UIView = {
        let v = UIView()
        v.frame = CGRect.init(x: 80, y: 0, width: kScreenWidth - 160, height: 44)
        v.backgroundColor = UIColor.orange
        v.isUserInteractionEnabled = true
        
        return v
    }()
    
    fileprivate lazy var leftBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 80, height: 30)
        btn.setTitle("新订单", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.setTitleColor(.black, for: .selected)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(showNewOrder(btn:)), for: .touchUpInside)

        return btn
    }()

    fileprivate lazy var rightBtn : UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: kScreenWidth - 160 - 80, y: 0, width: 80, height: 30)
        btn.setTitle("预订单", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        btn.setTitleColor(.black, for: .selected)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(showReservationOrder(btn:)), for: .touchUpInside)
        
        return btn
    }()

    fileprivate lazy var rightBarButton : UIBarButtonItem = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: 0, y: 0, width: 60, height: 30)
        button.setTitle("列表", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitleColor(UIColor.black, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(pushNext), for: .touchUpInside)
        
        let btn = UIBarButtonItem.init(customView: button)
        return btn
    }()
}

extension ViewController: JLBTimePopViewDelegate {
    
    func getStartDate(startDate: String, endDate: String)
    {
        print("开始时间：\(startDate)" + "结束时间：\(endDate)")
    }
}

