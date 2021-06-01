//
//  JFCommonModel.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/31.
//

import UIKit
import ObjectMapper
class JFCommonModel: Mappable {

    var imageName: String?
    var desTitle : String?
    
    init(){
    }
    
    required init?(map: Map) {
    }
    // Mappable 一一映射
    
    func mapping(map:Map)  {
        imageName <- map["imageName"]
        desTitle <- map["desTitle"]
    }
    
}
