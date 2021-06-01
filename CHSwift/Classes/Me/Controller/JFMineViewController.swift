//
//  JFMineViewController.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit
import ObjectMapper
class JFMineViewController: JFBaseViewController ,UITableViewDelegate,UITableViewDataSource, JFMineTopCategoryCellDelegate, JFMineCellClickDelegate{

  
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        title = "我的"
        tableView.backgroundColor = JFStyle.navigarionBarColor()
        
        intNav()
        tableView.tableFooterView = UIView.init()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    
    }


  
}
extension JFMineViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell:JFMineAcconutCell  = JFMineAcconutCell.cellWithTableView(tableView)
            return cell;
        case 1:
            let cell:JFMineTopCategoryCell  = JFMineTopCategoryCell.cellWithTableView(tableView)
            cell.delegate = self
            
            cell.clickCallBack = {
                (name:String) -> Void in
                print("回调name"+name)
                
            }
            return cell;
        case 2:
            
            let cell:JFMineCell  = JFMineCell.cellWithTableView(tableView)
            
            //创建cell的类型
            cell.cellType = MineCellType.mineMoneyeCellType
            
            cell.delegate = self
            
            let jsonData = JFStyle.getJsonWithName(name: "mine")
            
            let modelArray = Mapper<JFCommonModel>().mapArray(JSONArray: jsonData as! [[String : Any]])
            
            cell.modelArray = modelArray as NSArray
            
            cell.cellTitle = "美团钱包"
            return cell
        default:
            let cell:JFMineAcconutCell  = JFMineAcconutCell.cellWithTableView(tableView)
            return cell;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 100
        case 2:
            return 160
        case 3:
            return 100
            
        default:
            return 160
        }
    }
    
    func mineTopCategoryCellClick(index: Int) {
        
        print(index)
    }
    
    func mineCellClick(mineCellType: MineCellType, index: Int) {
    
        
        print(mineCellType)
    }
    
}
extension JFMineViewController{
    func intNav() {
        
        self.setupCustomRightWithTitle(navtStyle: navigationBar.whiteStyle,title: "基础", target: self, action: #selector(rightBtnClick))
        
        self.setupCustomLeftWithImage(image: UIImage.init(named: "icon_main_setting-1")!, target: self, action: #selector(leftBtnClick))
    }
    
    @objc func rightBtnClick() {
        let VC:JFBasicKnowledgeListViewController = JFBasicKnowledgeListViewController.init(nibName: "JFBasicKnowledgeListViewController", bundle: nil)
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func leftBtnClick() {
//        let VC:JFSettingViewController = JFSettingViewController.init(nibName: "JFSettingViewController", bundle: nil)
//        navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.barTintColor = JFStyle.navigarionBarColor()
        //设置状态栏的颜色
        JFApplication.statusBarStyle = UIStatusBarStyle.lightContent;
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        JFApplication.statusBarStyle = UIStatusBarStyle.default;
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.tintColor = UIColor.black


    }
}
