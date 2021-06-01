//
//  JFHomeActiveCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit

class JFHomeActiveCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    var imageName:String?{
        didSet{
            imgView?.JF_Image(imageName: imageName!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFHomeActiveCell{
        let JFHomeActiveCell:String = "JFHomeActiveCell"
        
        var mineCell = tableView.dequeueReusableCell(withIdentifier: JFHomeActiveCell)
        
        if mineCell == nil{
            mineCell = Bundle.main.loadNibNamed("JFHomeActiveCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return mineCell as! JFHomeActiveCell
        
        
    }
    
}
