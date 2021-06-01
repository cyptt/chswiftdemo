//
//  JFSendValueViewController.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit

class JFSendValueViewController: JFBaseViewController,receiveValueDelegate {
 
    

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "传值"
    }

    @IBAction func propertyClick(_ sender: Any) {
        let VC:JFReceiveValueViewController  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        VC.sendValueType = sendType.propertyType
        VC.receiveValue = textField.text! as String
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func delegateClick(_ sender: Any) {
        let VC  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        VC.delegate = self
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func closureClick(_ sender: Any) {
        
        let VC  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        VC.receiveClosure = {(name:String) -> Void in self.textField.text = name }
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func noticeClick(_ sender: Any) {
        //观察通知
        JFNotificationCenter.addObserver(self, selector: #selector(JFSendValueViewController.getValue(notice:)), name: NSNotification.Name(rawValue: noticeSenderValue as String), object: nil)
        
        let VC  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
      
        navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func SingleCase(_ sender: Any) {
        let VC:JFReceiveValueViewController  = JFReceiveValueViewController.init(nibName: "JFReceiveValueViewController", bundle: nil)
        JFSendSingleton.shareInstance.value = textField.text!
        VC.sendValueType = sendType.singleCaseType
        navigationController?.pushViewController(VC, animated: true)
    }
}

//通知
extension JFSendValueViewController{
    ///通知实现
    @objc func getValue(notice:Notification) {
        textField.text = notice.object as? String
        //移除通知
        JFNotificationCenter.removeObserver(self, name: NSNotification.Name(rawValue: noticeSenderValue as String), object: nil)
    }
}

//delegate
extension JFSendValueViewController{
    func buttonClick(value: String) {
        textField.text = value as String
    }
}
