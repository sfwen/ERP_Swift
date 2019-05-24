//
//  CurrUserInfo.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/17.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

class CurrUserInfo:JSONMappable {
    var User: UserModel
    var UserPoss: [UserPossModel]
    var Session: SessionModel
    
    required init(json: JSON) {
        self.User = UserModel.init(json: json["User"])//UserModel(json: json["User"])
        UserPoss = json["UserPoss"].arrayValue.map({ (j) -> UserPossModel in
            UserPossModel(json: j)
        })
        Session = SessionModel(json: json["Session"])
    }
}

