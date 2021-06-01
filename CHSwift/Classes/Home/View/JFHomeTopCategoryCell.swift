//
//  JFHomeTopCategoryCell.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/31.
//

import UIKit

class JFHomeTopCategoryCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var modelArrary:[JFCommonModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "JFHomeTopCategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: homeTopCellCollectionReuseIdentifierID as String)
        
        collectionLayout.minimumLineSpacing = 0.0
        collectionLayout.minimumInteritemSpacing = 0.0
        
        collectionView.isScrollEnabled = false
        
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(_ tableView:UITableView) -> JFHomeTopCategoryCell {
        let JFHomeTopCategoryCell:NSString = "JFHomeTopCategoryCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: JFHomeTopCategoryCell as String)
        if cell == nil {
            cell = Bundle.main.loadNibNamed("JFHomeTopCategoryCell", owner: nil, options: nil)?.last as? UITableViewCell
        }
        return cell as! JFHomeTopCategoryCell
    }
    
    //UICollectionViewDataSource
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (modelArrary.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = JFHomeTopCategoryCollectionCell.cellWithCollectionView(collectionView, indexPath as NSIndexPath)
        cell.model = modelArrary[indexPath.row]
     
        return cell
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: JFSCREEN_WIDTH/5, height: self.frame.size.height)
    }
    
}
