//
//  JFMineAcconutCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit

class JFMineAcconutCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    class func cellWithTableView(_ tableView:UITableView) -> JFMineAcconutCell {
        
        let JFMineAcconutCell:NSString = "JFMineAcconutCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFMineAcconutCell as String )
        
        if cell == nil {
            
            cell = Bundle.main.loadNibNamed("JFMineAcconutCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFMineAcconutCell
    }
}
