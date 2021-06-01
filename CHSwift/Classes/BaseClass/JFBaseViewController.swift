//
//  JFBaseViewController.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/27.
//

import UIKit

class JFBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
        let backButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setImage(UIImage.init(named: "beauty_icon_back"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        let item = UIBarButtonItem.init(customView: backButton)
        self.navigationItem.backBarButtonItem = item
        
        
    }
    
    /// 基类里面定制右边的按钮
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - target: 哪个监听泽
    ///   - action: 方法
    
    func setupCustomRightWithImage(image:UIImage,target:Any,action:Selector) {
        
        let button:UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
        button.setImage(image, for: UIControl.State.normal)
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        let rightItem:UIBarButtonItem = UIBarButtonItem.init(customView: button)
        navigationItem.rightBarButtonItem = rightItem
    }
    
    func setupCustomRightWithTitle(navtStyle:navigationBar, title:NSString,target:Any,action:Selector){
        let button:UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.setTitle(title as String, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        if navtStyle == navigationBar.whiteStyle {
            button.setTitleColor(UIColor.white, for: .normal)

        }else{
            button.setTitleColor(UIColor.black, for: .normal)
        }
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        let rightItem:UIBarButtonItem =  UIBarButtonItem.init(customView: button)
        navigationItem.rightBarButtonItem = rightItem
    }
    
    func setupCustomLeftWithTitle(title:NSString,target:Any,action:Selector){
        let button:UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.setTitle(title as String, for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        let leftItem:UIBarButtonItem =  UIBarButtonItem.init(customView: button)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    func setupCustomLeftWithImage(image:UIImage,target:Any,action:Selector){
        let button:UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        button.setImage(image, for: UIControl.State.normal)
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        let leftItem:UIBarButtonItem =  UIBarButtonItem.init(customView: button)
        navigationItem.leftBarButtonItem = leftItem
    }

}
