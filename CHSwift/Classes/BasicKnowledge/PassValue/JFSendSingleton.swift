//
//  JFSendSingleton.swift
//  CHSwift
//
//  Created by cyptt on 2021/6/1.
//

import UIKit

class JFSendSingleton: NSObject {

    var value = ""
    static let shareInstance = JFSendSingleton()
    private override init() {
        
    }
    
}
