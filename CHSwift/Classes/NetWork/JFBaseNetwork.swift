//
//  JFBaseNetwork.swift
//  CHSwift
//
//  Created by cyptt on 2021/5/27.
//

import UIKit
import Alamofire

//定义一个block闭包
typealias sucess = () -> Any
typealias failure = () -> Error
class JFBaseNetwork: NSObject {
    var value = ""
    static let shareInstance = JFBaseNetwork()
    private override init() {
        
    }
    
    var sucessBlock = sucess.self
    var failureBlock = failure.self
    
    func initData()  {
        let urlString = "http://www.weather.com.cn/data/cityinfo/101010100.html"
        Alamofire.request(urlString,method: HTTPMethod.get,parameters: [:],encoding: URLEncoding.default,headers: JFHeaders()).responseJSON { (response) in
            switch response.result{
            case .success:
                
                print("请求成功")
                
                print("\(response.result)")
                print(response.result.value)
                
            case .failure(let error):
                print("请求失败")
                print(error)
            }
        }
    }
    static func postDataByString(urlSting: String, bodyDic: NSDictionary!, succeed: @escaping (_ responeObject: NSString) -> (), fail: @escaping (_ error: AnyObject) -> ()){
        
      
    }
    
    func JFHeaders() -> (Dictionary<String, String>) {
        //声明一个字典
        let someDict:[String:String] = ["1":"One", "2":"Two", "3":"Three"]
        return someDict
    }
    
    

}
