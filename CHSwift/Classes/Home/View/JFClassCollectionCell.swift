//
//  JFClassCollectionCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/31.
//

import UIKit

class JFClassCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var desLb: UILabel!
    
    var model:JFCommonModel?{
        didSet{
            imgView.image = UIImage.init(named: (model?.imageName)!)
            desLb.text = model?.desTitle
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellWithCollectionView(_ collectionView:UICollectionView ,_ indexPath:NSIndexPath) -> JFClassCollectionCell{
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeClassCellCollectionReuseIdentifierID as String, for: indexPath as IndexPath) as? JFClassCollectionCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFClassCollectionCell", owner: nil, options: nil)?.last as? JFClassCollectionCell
        }
        return cell!

    }
    

}
