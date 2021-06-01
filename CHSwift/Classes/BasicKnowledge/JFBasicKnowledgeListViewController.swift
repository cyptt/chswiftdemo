//
//  JFBasicKnowledgeListViewController.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit
import NVActivityIndicatorView
import Toast_Swift
class JFBasicKnowledgeListViewController: JFBaseViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray:NSArray {
        let tmpArray = ["传值","loading....","分页","轮播图","toast",
                        "引导页","模块化tableView","MVVM","视频播放器","城市选择"]
        return tmpArray as NSArray
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "基础"
        tableView.rowHeight = 50
        tableView.tableFooterView = UIView.init()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = UIColor.white
     
        
    }


 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = JFMeCell.CellWithTableView(tableView)
        cell.typeLabel.text = dataArray[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let VC = JFSendValueViewController.init(nibName: "JFSendValueViewController", bundle: nil)
            navigationController?.pushViewController(VC, animated: true)
        }else if (indexPath.row == 1){
          
            let activityIndicatorView:NVActivityIndicatorView =
            NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),color: UIColor.red,padding: 10)
    
            self.view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimating()
            DispatchQueue(label: "ddddd").async {
                print(Thread.current)
            }
            let time:TimeInterval = TimeInterval(3)
            DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + time) {
                
                activityIndicatorView.stopAnimating()
             
            }
            
        }else if(indexPath.row == 2){
            
        }else if(indexPath.row == 3){
            
        }else if(indexPath.row == 4){
            self.view.makeToast("ddddd")
        }
    }
    
    

}
