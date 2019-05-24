//
//  MainMessageModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/19.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

enum MainMessageType {
    case Normal
    case UnfinishWork
    case WaitAcceptance //待验收
    case WaitRectification //待整改
    case MaterialAcceptance //材料验收
    case HaveFinished //已处理
    case MyProcess //我的流程
    case LatestNotif //最新通知
    case Notepad //记事本
    case SystemMessage //系统消息
    case AllUnfinishWork //全部未处理任务
}

class MainMessageModel: NSObject {
    var icon : String?
    var title : String?
    var describe : String?
    var unreadCount : String?
    var mainMessageType : MainMessageType?
}
