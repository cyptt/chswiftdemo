//
//  JFHomeTopCategoryCollectionCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/31.
//

import UIKit

class JFHomeTopCategoryCollectionCell: UICollectionViewCell {
    @IBOutlet weak var desLb: UILabel!
    
    @IBOutlet weak var imageV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var model:JFCommonModel?{
        didSet{
            imageV.image = UIImage.init(named: (model?.imageName)!)
            desLb.text = model?.desTitle
        }
    }
    
    class func cellWithCollectionView(_ collectionView:UICollectionView ,_ indexPath:NSIndexPath) -> JFHomeTopCategoryCollectionCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeTopCellCollectionReuseIdentifierID as  String, for: indexPath as IndexPath) as? JFHomeTopCategoryCollectionCell
        
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFHomeTopCategoryCollectionCell", owner: nil, options: nil)?.last as? JFHomeTopCategoryCollectionCell
        }
        
        return cell!
        
    }

}
