//
//  ClientInfo.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/15.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

class ClientInfo: JSONMappable {
    var DeviceName :String = ""
    var OS :String = ""
    var IP :String = ""
    var DeviceTag = ""
    
    required init(json: JSON) {
        
    }
    
//    //MARK:-  自定义构造函数
//    init(_ dict : [String: Any]){
//        super.init()
//        setValuesForKeys(dict)
//    }
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        
//    }
}
