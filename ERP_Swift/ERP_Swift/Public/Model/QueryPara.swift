//
//  QueryPara.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/24.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

class QueryPara: JSONMappable {
    required init(json: JSON) {
        
    }
    
    var PageSize : Int? = 20
    var PageCount : Int? = 1
    var QueryKey : String!
    var IsPaging : Bool? = true
    var StartIndex : Int? = 0
    
//    override init() {
//        self.PageSize = 20
//        self.PageCount = 1
//    }
}
