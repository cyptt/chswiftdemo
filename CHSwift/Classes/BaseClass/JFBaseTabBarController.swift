//
//  JFBaseViewController.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/26.
//

import UIKit

class JFBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()


        self.tabBar.isTranslucent = false;//tabbar 不透明
        setChildrenControllers()
    }
    

}

extension JFBaseTabBarController{
    fileprivate func setChildrenControllers(){
        let tabBarArr = JFStyle.getJsonWithName(name: "main")
        
        var arrVC = [UIViewController]()
        for dict in tabBarArr as Array {
            arrVC.append(childrenController(dict: dict as! [String:AnyObject]))
        }
        viewControllers = arrVC;
    
    }
    
    //使用字典加载控制器
    fileprivate func childrenController(dict: [String : AnyObject]) -> UIViewController{
        
        //获取内容
        guard let RootVcName = dict["RootVcName"] as? String,
            let TabbarTitle = dict["TabbarTitle"] as? String,
            let NorImgName = dict["NorImgName"] as? String,
            let SellectImgName = dict["SellectImgName"] as? String,
            let RootVc = NSClassFromString(Bundle.main.namespace + "." + RootVcName) as? JFBaseViewController.Type
    
        else{
            return UIViewController()
        }
        
        //创建控制器视图
        let rootVc = RootVc.init()
        rootVc.title = TabbarTitle
        rootVc.tabBarController?.tabBarItem.title = TabbarTitle

        
        //设置图片
        rootVc.tabBarItem.image = UIImage(named: NorImgName)
        rootVc.tabBarItem.selectedImage = UIImage(named: SellectImgName)?.withRenderingMode(.alwaysOriginal)
        
        rootVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.gray], for:.selected)
        rootVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: JFStyle.navigarionBarColor()], for: .selected)
        rootVc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 9.0)], for: .normal)
        
        //实例化导航控制器
        let nav = JFBaseNacigationController(rootViewController: rootVc)
        
        return nav
        
        
    }
}

//获取命名空间
extension Bundle{
    //计算型属性类似于函数，没有参数，有返回值
    var namespace:String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
