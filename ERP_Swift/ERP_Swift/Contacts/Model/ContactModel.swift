//
//  ContactModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/12.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON

class ContactModel: BasicModel {
    let isCollection : Bool
    let stfID : String
    let iD : String
    let headPath : String
    let posName : String
    let name : String
    let vPhoneNum : String
    let phoneNum : String
    
    init(json:JSON){
        self.isCollection =  json["IsCollection"].boolValue
        self.stfID =  json["StfID"].stringValue
        self.iD =  json["ID"].stringValue
        self.headPath =  json["HeadPath"].stringValue
        self.posName =  json["PosName"].stringValue
        self.name =  json["Name"].stringValue
        self.vPhoneNum =  json["VPhoneNum"].stringValue
        self.phoneNum =  json["PhoneNum"].stringValue
    }
    
    func toDict() -> [String:Any]{
        var dict : [String:Any] = [ : ]
        dict["IsCollection"] = self.isCollection
        dict["StfID"] = self.stfID
        dict["ID"] = self.iD
        dict["HeadPath"] = self.headPath
        dict["PosName"] = self.posName
        dict["Name"] = self.name
        dict["VPhoneNum"] = self.vPhoneNum
        dict["PhoneNum"] = self.phoneNum
        return dict
    }
}


/// "IsCollection" : false,
/// "StfID" : null,
/// "HeadPath" : "",
/// "PosName" : "【四川幸福魔方装饰】设计部\/设计三部\/设计师(正式)",
/// "VPhoneNum" : "",
/// "Name" : "设计一部设计师1",
/// "ID" : "09c8bc0d-5034-43a6-b0c3-8a03797bc474",
/// "PhoneNum" : null



