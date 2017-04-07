//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/2/9.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func loadView()
    {
        let listView = UITableView()
        listView.delegate = self
        listView.dataSource = self
        listView.frame = UIScreen.main.bounds
        listView.separatorStyle = UITableViewCellSeparatorStyle.none
        listView.register(FirstCell.self, forCellReuseIdentifier: "firstCell")
        
        view = listView
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "列表"
    }
    
    // MARK: - 懒加载
    

}

// 苹果官方建议，把数据源代理方法单独写到一个扩展中，以便提高代码的可读性

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - tableview delegate && dataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FirstCell
        cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstCell
        
        cell.nickNameLabel.text = "王大锤"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = UIColor.clear
        return footer
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0
        {
            let vc = DetailController()
            vc.name = "傻啊"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let vc = OrderController()
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}


