//
//  JLBTimePopView.swift
//  SwiftDemo
//
//  Created by gaojianlong on 2017/3/6.
//  Copyright © 2017年 user1. All rights reserved.
//

import UIKit
fileprivate let kGaoJianLongScreenWidth: CGFloat = UIScreen.main.bounds.size.width
fileprivate let kGaoJianLongScreenHeight: CGFloat = UIScreen.main.bounds.size.height

fileprivate let kGaoJianLongWidthScale: CGFloat = 375.0
fileprivate let kGaoJianLongHeightScale: CGFloat = 667.0

//弹窗距离左右边距
fileprivate let kGaoJianLongSpaceLeftOrRight: CGFloat = 35
//弹窗距离上边距
fileprivate let kGaoJianLongSpaceTop: CGFloat = 114
//弹窗宽度
fileprivate let kGaoJianLongPopView_Width: CGFloat = kGaoJianLongScreenWidth - (kGaoJianLongSpaceLeftOrRight * 2)
//弹窗高度
fileprivate let kGaoJianLongPopView_Height: CGFloat = 220
//时间选择器的高度
fileprivate let kGaoJianLongDatePicker_Height: CGFloat = 200


@objc protocol JLBTimePopViewDelegate
{
    @objc optional func getStartDate(startDate:String, endDate:String)
}

class JLBTimePopView: UIView {
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        UIApplication.shared.keyWindow?.addSubview(self)
        self.frame = self.superview?.bounds ?? UIScreen.main.bounds
        
        self.addSubview(coverView)
        self.addSubview(datePicker)
        self.addSubview(popView)
        
        setDatePickerStyle()
        setPopView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func shareTimePopView() -> JLBTimePopView
    {
        return JLBTimePopView.init(frame: UIScreen.main.bounds)
    }
     
    class func showPopView(delegate:JLBTimePopViewDelegate) -> JLBTimePopView
    {
        let popView = JLBTimePopView.shareTimePopView()
        popView.delegate = delegate
        popView.show()
        
        return popView
    }
 
    class func showPopView(delegate: JLBTimePopViewDelegate, startDate: String, endDate: String) -> JLBTimePopView
    {
        let popView = JLBTimePopView.shareTimePopView()
        popView.delegate = delegate
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        let date = formatter.date(from: startDate)
        
        popView.datePicker.setDate(date ?? popView.datePicker.date, animated: false)
        popView.startBtn.setTitle(startDate, for: .normal)
        popView.endBtn.setTitle(endDate, for: .normal)
        
        popView.show()
        return popView
    }
    
    fileprivate func show()
    {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.coverView.alpha = 0.5;
            self?.popView.alpha = 1;
            self?.datePicker.alpha = 1;
        }) { (finished) in
            
        }
    }
    
    fileprivate func dismiss()
    {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.coverView.alpha = 0;
            self?.popView.alpha = 0;
            self?.datePicker.alpha = 0;
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
    
    // MARK: 自定义
    func startBtnAction(btn: UIButton)
    {
        btn.isSelected = true
        endBtn.isSelected = false
        
        rollCurrentDate(btn: btn)
    }
    
    func endBtnAction(btn: UIButton)
    {
        btn.isSelected = true
        startBtn.isSelected = false
        
        rollCurrentDate(btn: btn)
    }
    
    func cancelBtnAction()
    {
        dismiss()
    }
    
    func confirmBtnAction()
    {
        if (delegate != nil) && ((delegate?.getStartDate(startDate: endDate:)) != nil)
        {
            delegate?.getStartDate!(startDate: startBtn.currentTitle ?? "2017-03-07", endDate: endBtn.currentTitle ?? "2017-03-31")
        }
        dismiss()
    }
    
    func datePicekerValueChanged(picker: UIDatePicker)
    {
        let date = picker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let titleString: String = dateFormatter.string(from: date)
        
        let isStartSelected: String = startBtn.isSelected ? "true" : "false"
        
        if isStartSelected == "true"
        {
            startBtn.setTitle(titleString, for: .normal)
        }
        else
        {
            endBtn.setTitle(titleString, for: .normal)
        }
    }
    
    
    // 代理属性
    var delegate : JLBTimePopViewDelegate?
    
    // MARK: 属性
    fileprivate lazy var coverView : UIView = {
        let v = UIView()
        v.frame = CGRect.init(x: 0, y: 0, width: kGaoJianLongScreenWidth, height: kGaoJianLongScreenHeight)
        v.backgroundColor = UIColor.black
        v.alpha = 0
        
        return v
    }()
    
    fileprivate lazy var popView : UIView = {
        let v = UIView()
        v.frame = CGRect.init(x: kGaoJianLongSpaceLeftOrRight, y: kGaoJianLongSpaceTop, width: kGaoJianLongPopView_Width, height: kGaoJianLongPopView_Height)
        v.backgroundColor = UIColor.white
        v.layer.masksToBounds = true;
        v.layer.cornerRadius = 10;
        v.alpha = 0
        
        return v
    }()
    
    fileprivate lazy var startBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitleColor(JLBTimePopView.kRgbColor(r: 51, g: 51, b: 51), for: .normal)
        btn.setTitleColor(JLBTimePopView.kRgbColor(r: 15, g: 156, b: 254), for: .selected)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17);
        btn.titleLabel?.textAlignment = .right;
        btn.addTarget(self, action: #selector(startBtnAction(btn:)), for: .touchUpInside)
        
        let date = self.datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let titleString = dateFormatter.string(from: date)
        btn.setTitle(titleString, for: .normal)
        
        btn.isSelected = true
        return btn
    }()
 
    fileprivate lazy var endBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.setTitleColor(JLBTimePopView.kRgbColor(r: 51, g: 51, b: 51), for: .normal)
        btn.setTitleColor(JLBTimePopView.kRgbColor(r: 15, g: 156, b: 254), for: .selected)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        btn.titleLabel?.textAlignment = .left
        btn.addTarget(self, action: #selector(endBtnAction(btn:)), for: .touchUpInside)
        
        btn.setTitle("2016-09-30", for: .normal)
        return btn
    }()
    
    fileprivate lazy var cancelBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: self.popView.frame.height - 49, width: (self.popView.frame.width - 1) / 2.0, height: 49)
        btn.setTitle("取消", for: .normal)
        btn.setTitleColor(JLBTimePopView.kRgbColor(r: 51, g: 51, b: 51), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)

        return btn
    }()
    
    fileprivate lazy var confirmBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        let x: CGFloat = self.popView.frame.width - self.cancelBtn.frame.width - 1
        let y: CGFloat = self.popView.frame.height - 49
        let w: CGFloat = (self.popView.frame.width - 1) / 2.0
        let h: CGFloat = 49
        btn.frame = CGRect.init(x: x, y: y, width: w, height: h)
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(JLBTimePopView.kRgbColor(r: 51, g: 51, b: 51), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(confirmBtnAction), for: .touchUpInside)
        
        return btn
    }()
    
    fileprivate var datePicker: UIDatePicker = UIDatePicker()
}

extension JLBTimePopView {
    
    fileprivate class func kRgbColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor
    {
        return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    fileprivate func rollCurrentDate(btn: UIButton)
    {
        let dateStr: String? = btn.currentTitle
        let formatter: DateFormatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        
        let date: Date = formatter.date(from: dateStr ?? "2017-06-06")!
        datePicker.setDate(date, animated: true)
    }
    
    /// 设置日期选择器相关属性
    fileprivate func setDatePickerStyle()
    {
        datePicker.alpha = 0
        datePicker.frame = CGRect.init(x: 0, y: kGaoJianLongScreenHeight - kGaoJianLongDatePicker_Height + 20, width: kGaoJianLongScreenWidth, height: kGaoJianLongDatePicker_Height)
        datePicker.backgroundColor = UIColor.white
        datePicker.datePickerMode = .date;
        
        let minDate: Date = Date.init(timeIntervalSince1970: 60 * 60)
        let maxDate: Date = Date.init(timeIntervalSinceNow: 60 * 60)
        
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        
        datePicker.addTarget(self, action: #selector(datePicekerValueChanged(picker:)), for: .valueChanged)
    }
    
    /// 设置popView上的子控件
    fileprivate func setPopView()
    {
        //第一部分
        let titleLabel = UILabel()
        titleLabel.frame = CGRect.init(x: 0, y: 0, width: popView.frame.width, height: 50)
        titleLabel.text = "请选择统计时间"
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = JLBTimePopView.kRgbColor(r: 153, g: 153, b: 153)
        titleLabel.textAlignment = .center;
        popView.addSubview(titleLabel)

        let topLineView = UIView()
        topLineView.frame = CGRect.init(x: 0, y: 50, width: popView.frame.width, height: 1)
        topLineView.backgroundColor = JLBTimePopView.kRgbColor(r: 242, g: 242, b: 242)
        popView.addSubview(topLineView)
        
        //第二部分
        popView.addSubview(self.startBtn)
        self.startBtn.frame = CGRect.init(x: 20, y: topLineView.frame.maxY + 20, width: (popView.frame.width - 60) / 2.0, height: popView.frame.height - 100 - 40)

        let tempLabel = UILabel()
        tempLabel.frame = CGRect.init(x: self.startBtn.frame.maxX, y: self.startBtn.frame.minY, width: 20, height: self.startBtn.frame.height)
        tempLabel.textAlignment = .center
        tempLabel.text = "至"
        tempLabel.font = UIFont.systemFont(ofSize: 14)
        tempLabel.textColor = JLBTimePopView.kRgbColor(r: 153, g: 153, b: 153)
        popView.addSubview(tempLabel)
        
        popView.addSubview(self.endBtn)
        self.endBtn.frame = CGRect.init(x: tempLabel.frame.maxX, y: self.startBtn.frame.minY, width: self.startBtn.frame.width, height: self.startBtn.frame.height)
        
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect.init(x: 0, y: kGaoJianLongPopView_Height - 50, width: popView.frame.width, height: 1)
        bottomLineView.backgroundColor = JLBTimePopView.kRgbColor(r: 242, g: 242, b: 242)
        popView.addSubview(bottomLineView)
        
        //第三部分
        popView.addSubview(self.cancelBtn)
        
        let verticalLineView: UIView = UIView()
        verticalLineView.frame = CGRect.init(x: self.cancelBtn.frame.width, y: self.cancelBtn.frame.minY, width: 1, height: self.cancelBtn.frame.height)
        verticalLineView.backgroundColor = JLBTimePopView.kRgbColor(r: 242, g: 242, b: 242)
        popView.addSubview(verticalLineView)
        
        popView.addSubview(self.confirmBtn)
    }
}

