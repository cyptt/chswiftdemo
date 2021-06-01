//
//  JFMineTopCategoryCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit
//定义一个协议 声名一个协议的方法

protocol JFMineTopCategoryCellDelegate:NSObjectProtocol {
    func mineTopCategoryCellClick(index:Int)
}
class JFMineTopCategoryCell: UITableViewCell {

    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var commitView: UIView!
    @IBOutlet weak var collectionView: UIView!
    weak var delegate:JFMineTopCategoryCellDelegate?
    
    //设置必包回调
    var clickCallBack:((_ name:String)->(Void))?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.viewClick(index:)))
        historyView.addGestureRecognizer(tap)
        
        
        let commitViewTap = UITapGestureRecognizer.init(target: self, action: #selector(self.viewClick(index:)))
        commitView.addGestureRecognizer(commitViewTap)
        
        
        let collectionViewTap = UITapGestureRecognizer.init(target: self, action: #selector(self.viewClick(index:)))
        collectionView.addGestureRecognizer(collectionViewTap)
        
    }

    class func cellWithTableView(_ tableView:UITableView) -> JFMineTopCategoryCell {
        
        let JFMineTopCategoryCell:NSString = "JFMineTopCategoryCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFMineTopCategoryCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFMineTopCategoryCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFMineTopCategoryCell
    }
    
    @objc func viewClick(index:Int)  {
        if (delegate != nil)  {
            delegate?.mineTopCategoryCellClick(index: index)
        }
        
        if clickCallBack != nil {
            clickCallBack!("点击了")
        }
    }
    
}
