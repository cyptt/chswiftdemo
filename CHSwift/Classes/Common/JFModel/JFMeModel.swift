//
//  JFMeModel.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit
import ObjectMapper
class JFMeModel: Mappable {
    var headImageName : String?
    var type : String?
    var info : String?
    
    
    
    init(){
    }
    
    required init?(map: Map) {
    }
    
    // Mappable 一一映射
    func mapping(map: Map) {
        headImageName    <- map["headImageName"]
        type      <- map["type"]
        info <- map["info"]
        
    }
}
