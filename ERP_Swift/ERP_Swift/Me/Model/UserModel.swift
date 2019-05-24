//
//  UserModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/18.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON

enum StaffInfoEducation : Int {
    case None = 0
    case Primary = 1
    case JuniorMiddle
    case High
    case Secondary
    case JuniorCollege
    case Undergraduate
    case Master
    case Doctor
}

class UserModel: NSObject {
    let name : String
    let health : String
    let staffExps : String
    let fomalDate : String
    let staffPosList : String
    let nowAddr : String
    let stfName : String
    let posName : String
    let posCatg : Int
    let email : String
    let isMale : Bool
    let birthDate : String
    let isMarried : Bool
    let stfID : String
    let iD : String
    let oper : String
    let qQ : String
    let iDCardAddr : String
    let staffState : Int
    let vPhoneNum : String
    let phoneNum : String
    let entryDate : String
    let staffPosState : Int
    let staffNo : String
    let posIDs : String
    let posID : String
    let iDCardNo : String
    let stfHeadPath : String
    let quitDate : String
    let creTime : String
    let isFertility : Bool
    let uniqueID : String
    let coName : String
    let nation : String
    let coID : String
    let education : StaffInfoEducation
    let posNames : NSArray
    let weChat : String
    let staffRelats : String
    let updtTime : String
    let isUrban : Bool
    let operID : String
    let remark : String
    
    init(json:JSON){
        self.name = json["Name"].stringValue
        self.health =  json["Health"].stringValue
        self.staffExps =  json["StaffExps"].stringValue
        self.fomalDate =  json["FomalDate"].stringValue
        self.staffPosList =  json["StaffPosList"].stringValue
        self.nowAddr =  json["NowAddr"].stringValue
        self.stfName =  json["StfName"].stringValue
        self.posName =  json["PosName"].stringValue
        self.posCatg =  json["PosCatg"].intValue
        self.email =  json["Email"].stringValue
        self.isMale =  json["IsMale"].boolValue
        self.birthDate =  json["BirthDate"].stringValue
        self.isMarried =  json["IsMarried"].boolValue
        self.stfID =  json["StfID"].stringValue
        self.iD =  json["ID"].stringValue
        self.oper =  json["Oper"].stringValue
        self.qQ =  json["QQ"].stringValue
        self.iDCardAddr =  json["IDCardAddr"].stringValue
        self.staffState =  json["StaffState"].intValue
        self.vPhoneNum =  json["VPhoneNum"].stringValue
        self.phoneNum =  json["PhoneNum"].stringValue
        self.entryDate =  json["EntryDate"].stringValue
        self.staffPosState =  json["StaffPosState"].intValue
        self.staffNo =  json["StaffNo"].stringValue
        self.posIDs =  json["PosIDs"].stringValue
        self.posID =  json["PosID"].stringValue
        self.iDCardNo =  json["IDCardNo"].stringValue
        self.stfHeadPath =  json["StfHeadPath"].stringValue
        self.quitDate =  json["QuitDate"].stringValue
        self.creTime =  json["CreTime"].stringValue
        self.isFertility =  json["IsFertility"].boolValue
        self.uniqueID =  json["UniqueID"].stringValue
        self.coName =  json["CoName"].stringValue
        self.nation =  json["Nation"].stringValue
        self.coID =  json["CoID"].stringValue
        self.education =  StaffInfoEducation(rawValue: json["Education"].intValue)!
        self.posNames =  json["PosNames"].arrayValue as NSArray
        self.weChat =  json["WeChat"].stringValue
        self.staffRelats =  json["StaffRelats"].stringValue
        self.updtTime =  json["UpdtTime"].stringValue
        self.isUrban =  json["IsUrban"].boolValue
        self.operID =  json["OperID"].stringValue
        self.remark =  json["Remark"].stringValue
    }
    
    func toDict() -> [String:Any]{
        var dict : [String:Any] = [ : ]
        dict["Name"] = self.name
        dict["Health"] = self.health
        dict["StaffExps"] = self.staffExps
        dict["FomalDate"] = self.fomalDate
        dict["StaffPosList"] = self.staffPosList
        dict["NowAddr"] = self.nowAddr
        dict["StfName"] = self.stfName
        dict["PosName"] = self.posName
        dict["PosCatg"] = self.posCatg
        dict["Email"] = self.email
        dict["IsMale"] = self.isMale
        dict["BirthDate"] = self.birthDate
        dict["IsMarried"] = self.isMarried
        dict["StfID"] = self.stfID
        dict["ID"] = self.iD
        dict["Oper"] = self.oper
        dict["QQ"] = self.qQ
        dict["IDCardAddr"] = self.iDCardAddr
        dict["StaffState"] = self.staffState
        dict["VPhoneNum"] = self.vPhoneNum
        dict["PhoneNum"] = self.phoneNum
        dict["EntryDate"] = self.entryDate
        dict["StaffPosState"] = self.staffPosState
        dict["StaffNo"] = self.staffNo
        dict["PosIDs"] = self.posIDs
        dict["PosID"] = self.posID
        dict["IDCardNo"] = self.iDCardNo
        dict["StfHeadPath"] = self.stfHeadPath
        dict["QuitDate"] = self.quitDate
        dict["CreTime"] = self.creTime
        dict["IsFertility"] = self.isFertility
        dict["UniqueID"] = self.uniqueID
        dict["CoName"] = self.coName
        dict["Nation"] = self.nation
        dict["CoID"] = self.coID
        dict["Education"] = self.education
        dict["PosNames"] = self.posNames
        dict["WeChat"] = self.weChat
        dict["StaffRelats"] = self.staffRelats
        dict["UpdtTime"] = self.updtTime
        dict["IsUrban"] = self.isUrban
        dict["OperID"] = self.operID
        dict["Remark"] = self.remark
        return dict
    }
    
//    required init(json: JSON) {
//        LoginID = json["LoginID"].stringValue
//        Name = json["Name"].stringValue
//    }
}

func staffInfoEducationToStr(_ education : StaffInfoEducation) -> String {
    var str = ""
    switch education {
    case .Primary:
        str = "小学"
    case .JuniorMiddle:
        str = "初中"
    case .High:
        str = "高中"
    case .Secondary:
        str = "中专"
    case .JuniorCollege:
        str = "大专"
    case .Undergraduate:
        str = "本科"
    case .Master:
        str = "硕士"
    case .Doctor:
        str = "博士"
    default:
        break
    }
    return str
}


/// "Health" : "",
/// "StaffExps" : null,
/// "FomalDate" : null,
/// "StaffPosList" : null,
/// "NowAddr" : "",
/// "StfName" : "盘古",
/// "PosName" : "【四川幸福魔方装饰】测试(正式)",
/// "PosCatg" : 0,
/// "Email" : "",
/// "IsMale" : null,
/// "BirthDate" : "1111-11-11 00:00:00",
/// "IsMarried" : null,
/// "StfID" : "dcdea644-0906-4a3d-9e11-50f819b2d4a6",
/// "Oper" : null,
/// "QQ" : "",
/// "IDCardAddr" : "",
/// "StaffState" : 0,
/// "VPhoneNum" : null,
/// "EntryDate" : "2017-07-01 00:00:00",
/// "StaffPosState" : 0,
/// "StaffNo" : "01234567",
/// "PosIDs" : null,
/// "IDCardNo" : "141141111111111111",
/// "StfHeadPath" : "",
/// "QuitDate" : null,
/// "CreTime" : "2017-08-22 15:21:38",
/// "ID" : "dcdea644-0906-4a3d-9e11-50f819b2d4a6",
/// "PhoneNum" : "12121212129",
/// "IsFertility" : null,
/// "UniqueID" : "dcdea644-0906-4a3d-9e11-50f819b2d4a6",
/// "CoName" : null,
/// "Nation" : "",
/// "CoID" : null,
/// "Education" : 0,
/// "PosNames" : [
/// ],
/// "WeChat" : "",
/// "StaffRelats" : null,
/// "UpdtTime" : "2017-08-22 15:21:38",
/// "IsUrban" : null,
/// "PosID" : null,
/// "OperID" : null,
/// "Remark" : ""

//model(eq, hash)
//Health;StaffExps;FomalDate;StaffPosList;NowAddr;StfName;PosName;PosCatg:i;Email;IsMale;BirthDate;IsMarried;StfID;ID;Oper;QQ;IDCardAddr;StaffState:i;VPhoneNum;PhoneNum;EntryDate;StaffPosState:i;StaffNo;PosIDs;PosID;IDCardNo;StfHeadPath;QuitDate;CreTime;IsFertility;UniqueID;CoName;Nation;CoID;Education:i;PosNames;WeChat;StaffRelats;UpdtTime;IsUrban;OperID;Remark
