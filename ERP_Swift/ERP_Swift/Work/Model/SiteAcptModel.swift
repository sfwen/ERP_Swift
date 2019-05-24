//
//  SiteAcptModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/3.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

enum SiteAcptState : Int {
    ///新建
    case AddNew = 1
    ///待分派
    case WaitAssign
    ///待验收
    case WaitAccept
    ///已完成
    case Completed
    ///已取消
    case Canceled
}

enum SiteAcptQuality : Int {
    ///空状态
    case Normal = 0
    case Ture = 1
    case False = 2
}

class SiteAcptModel: BasicModel, JSONMappable {
    var ID : String?
    var ContAddr : String?
    var OrderTime : String?
    var ProjName : String?
    var IsQualified : SiteAcptQuality?
    var State : SiteAcptState?
    
    var isQualifiedText: String {
        var str = ""
        switch self.IsQualified {
        case .Ture?:
            str = "合格"
        case .False?:
            str = "不合格"
        default:
            str = "未验收"
            break
        }
        return str
    }
    
    var projNameText: String {
        let str = self.ProjName! + "," + self.isQualifiedText
        return str
    }
    
    required init(json: JSON) {
        self.ID = json["ID"].stringValue
        self.ProjName = json["ProjName"].stringValue
        self.OrderTime = json["OrderTime"].stringValue
        self.ContAddr = json["ContAddr"].stringValue
        self.State = SiteAcptState(rawValue:json["State"].intValue)
        self.IsQualified = SiteAcptQuality(rawValue:json["IsQualified"].intValue)
    }
}

func siteAcptStateToStr(_ state : SiteAcptState) -> String {
    var str = ""
    switch state {
    case .AddNew:
        str = "新建"
    case .WaitAssign:
        str = "待分派"
    case .WaitAccept:
        str = "待验收"
    case .Completed:
        str = "已完成"
    case .Canceled:
        str = "已取消"
    }
    return str
}
