//
//  JFBaseNacigationController.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/27.
//

import UIKit

class JFBaseNacigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏标题属性：设置标题颜色
        navigationBar.titleTextAttributes  = [NSAttributedString.Key.foregroundColor:UIColor.black]
        // 设置导航栏前景色：设置item指示色
        navigationBar.tintColor = UIColor.black
        
        //设置导航栏半透明
        navigationBar.isTranslucent = false
        
        
        // 4.设置导航栏背景图片
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        // 5.设置导航栏阴影图片
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //设置导航栏的背景色
        navigationBar.barTintColor = UIColor.white
        
        //去除导航栏的下划线
        navigationBar.shadowImage = UIImage.init()
        
        //设置状态栏的颜色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default;
        
        //        UIImage *backImage = [UIImage imageNamed:@"backNor"];
        //        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backImage.size.width, 0, 0)]
        //            forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-233, 0) forBarMetrics:UIBarMetricsDefault];
                
        //        let backImage:UIImage = UIImage.init(named: "")!
    }
    

}

extension JFBaseNacigationController{
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0  {
            viewController.hidesBottomBarWhenPushed = true
            viewController.view.backgroundColor = UIColor.white
        }
        super.pushViewController(viewController, animated: true)
    }
}
