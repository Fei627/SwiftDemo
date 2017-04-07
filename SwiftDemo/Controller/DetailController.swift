//
//  DetailController.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/3/2.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setSubviews()
        setData()
    }

    func setSubviews()
    {
        title = name
        
        view.addSubview(table)
    }
    
    func setData()
    {
        model = SecondModel()
        frameModel = SecondCellFrame()

        model?.expect = "立即送达"
        model?.remark = "多带一双筷子吧，我们100个人吃一碗饭，太尼玛惨了"
        model?.time = "2017-03-03 12：00"
        model?.order_num = "315678169491"
        
        frameModel?.model = model
    }
    
    // MARK: 属性
    
    /// 模型
    var model : SecondModel?
    var frameModel : SecondCellFrame?
    
    /// 导航栏标题
    var name : String?
    
    
    // MARK: lazy load
    
    lazy var table : UITableView = {
        let list = UITableView()
        list.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: (self.view.frame.height))
        list.delegate = self
        list.dataSource = self
        
        list.register(SecondCell.self, forCellReuseIdentifier: "SecondCell")
        
        return list
    }()
    
}

extension DetailController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return (frameModel?.cellHeight ?? CGFloat.init(60))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SecondCell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondCell
        
        cell.frameModel = frameModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let footer = UIView()
        footer.backgroundColor = UIColor.white
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return CGFloat.leastNormalMagnitude
    }
    
}
