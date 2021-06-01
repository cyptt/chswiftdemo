//
//  JFHomeConmonModel.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/27.
//

import UIKit
import ObjectMapper
class JFHomeConmonModel: Mappable {
    /*
     "imageName": "大笑",
     "title": "大笑",
     "type": "喜剧",
     "desTitle": "打车",
     "distance": "5.0km",
     "saleNumber": "50份",
     "price": "￥30",
     */
    
    var imageName:String?
    var title:String?
    var type:String?
    var desTitle:String?
    var distance:String?
    var saleNumber:String?
    var price:String?
    required init?(map:Map){
        
    }
    init(){
        
    }
    
    // Mappable 一一映射
    func mapping(map:Map)  {
        imageName    <- map["imageName"]
        title        <- map["title"]
        type         <- map["type"]
        desTitle     <- map["desTitle"]
        distance     <- map["distance"]
        saleNumber   <- map["saleNumber"]
        price        <- map["price"]
    }

}
