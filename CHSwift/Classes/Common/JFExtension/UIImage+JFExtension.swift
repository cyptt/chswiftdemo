//
//  UIImage+JFExtension.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/28.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    func JF_Image(imageName:String)  {
        if imageName.hasPrefix("http") {
            let url = URL(string: imageName)
            self.kf.setImage(with: url)
            
        }else{
            self.image = UIImage.init(named: imageName)
        }
    }
}
