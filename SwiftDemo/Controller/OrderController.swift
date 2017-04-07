//
//  OrderController.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/3/6.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit

class OrderController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "我的订单"

        setSubviews()
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        table.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 64)
    }
    
    func setSubviews()
    {
        view.addSubview(table)
    }
    
    // MARK: 属性
    fileprivate lazy var table: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        
        return t
    }()
    
}

extension OrderController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        switch indexPath.row
        {
        case 0:
            return 50
        case 1:
            return 100
        case 2:
            return 60
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let v = UIView()
        return v
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return CGFloat.leastNormalMagnitude
    }
    
}
