//
//  JFHomeFeaturesCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit

class JFHomeFeaturesCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFHomeFeaturesCell {
        
        let JFHomeFeaturesCell:NSString = "JFHomeFeaturesCell"
        
        var mineCell = tableView.dequeueReusableCell(withIdentifier: JFHomeFeaturesCell as String )
        
        if mineCell == nil {
            
            mineCell = Bundle.main.loadNibNamed("JFHomeFeaturesCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return mineCell as! JFHomeFeaturesCell
    }
    
}
