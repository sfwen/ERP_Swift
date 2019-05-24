//
//  SessionModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/18.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

class SessionModel: JSONMappable {
    var SessionID: String?
    var LoginStafPosID: String?
    
    required init(json: JSON) {
        SessionID = json["SessionID"].stringValue
        LoginStafPosID = json["LoginStafPosID"].stringValue
    }
}
