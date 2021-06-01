//
//  JFReceiveValueViewController.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit

//枚举的定义
enum sendType {
    case propertyType
    case singleCaseType
}
//协议
protocol receiveValueDelegate:NSObjectProtocol {
    func buttonClick(value:String) 
}

//必包
typealias receiveValueClosure = (_ value:String) ->Void
class JFReceiveValueViewController: JFBaseViewController {
    @IBOutlet weak var textField: UITextField!
    
    
    //声明一个代理
    weak var delegate:receiveValueDelegate?
    
    //声明一个闭包用来接收闭包
    var receiveClosure:receiveValueClosure?
    
    //声明一个属性
    var receiveValue:String = ""
    
    //声明一个枚举
    var sendValueType:sendType!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sendValueType == sendType.propertyType {
            textField.text = receiveValue as String?
        }else if (sendValueType == sendType.singleCaseType){
            //单例传值
            textField.text = JFSendSingleton.shareInstance.value
        }

       
        
    }


    @IBAction func backClick(_ sender: Any) {
        
        //代理
        if self.delegate != nil{
            self.delegate?.buttonClick(value: textField.text!)
        }
        
        //闭包
        if self.receiveClosure != nil {
            self.receiveClosure!(textField.text!)
        }
        
        //发布通知
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: noticeSenderValue as String), object: textField.text)
        
        navigationController?.popViewController(animated: true)
    
    }
    

}
