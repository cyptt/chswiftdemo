//
//  JFCarouselCollectionCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/28.
//

import UIKit

class JFCarouselCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageUrlStr:String? {
        didSet{
            imageView.JF_Image(imageName: imageUrlStr!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        imageView.contentMode = .scaleToFill
        
    }
    class func cellWithCollectionView(_ collectionView:UICollectionView,_ indexPah:NSIndexPath)-> JFCarouselCollectionCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: carouselCellCollectionReuseIdentifierID as String, for: indexPah as IndexPath) as? JFCarouselCollectionCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFClassCollectionCell", owner: nil, options: nil)?.last as? JFCarouselCollectionCell
        }
        return cell!
        
    }

}
