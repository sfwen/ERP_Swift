//
//  UserPossModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/18.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

class UserPossModel: JSONMappable {
    var CoName: String?
    var PosName: String?
    var ID: String?
    var StfName: String?
    var PosFullName: String?
    var DeptName: String?
    var StfID: String?
    
    required init(json: JSON) {
        CoName = json["CoName"].stringValue
        PosFullName = json["PosFullName"].stringValue
        ID = json["ID"].stringValue
    }
}
