//
//  CustomModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/2.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

class CustomModel: JSONMappable {
    var CustBldName : String?
    var CustName : String?
    var CustContactWays : NSMutableArray?
    var AreaName : String?
    var Address : String?
    
    required init(json: JSON) {
        self.CustName = json["CustName"].stringValue
        self.CustBldName = json["CustBldName"].stringValue
        let way = json["CustContactWays"].arrayValue
        self.CustContactWays = NSMutableArray.init()
        for s in way {
            self.CustContactWays?.add(s["Way"].stringValue)
        }
        self.AreaName = json["AreaName"].stringValue
        self.Address = json["Address"].stringValue
    }
}
