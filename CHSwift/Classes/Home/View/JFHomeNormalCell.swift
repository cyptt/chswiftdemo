//
//  JFHomeNormalCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit

class JFHomeNormalCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var distanceLb: UILabel!
    @IBOutlet weak var saleNumberLb: UILabel!
    @IBOutlet weak var desTitle: UILabel!
    @IBOutlet weak var priceLb: UILabel!
    @IBOutlet weak var typeLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    
    
    var model:JFHomeConmonModel?{
        didSet{
            imgView.JF_Image(imageName: (model?.imageName)!)
            titleLb.text = model?.title
            typeLb.text = model?.type
            desTitle.text = model?.desTitle
            priceLb.text = model?.price
            saleNumberLb.text = model?.saleNumber
            distanceLb.text = model?.distance
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
    
    class func cellWithTableView(_ tableView:UITableView) -> JFHomeNormalCell {
        
        let JFHomeNormalCellID:NSString = "JFHomeNormalCellID"
        
        var mineCell = tableView.dequeueReusableCell(withIdentifier: JFHomeNormalCellID as String )
        
        if mineCell == nil {
            
            mineCell = Bundle.main.loadNibNamed("JFHomeNormalCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return mineCell as! JFHomeNormalCell
    }
    
}
