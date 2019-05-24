//
//  BasicCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/19.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

let kTitileFont : Float = 17.0
let kSpace : Float = 6.0

typealias TableViewReloadDataBlock = () -> Void

class BasicCell: UITableViewCell {
    
    public var indexPath : NSIndexPath?
    
    public let identifier : String = {
        return String(describing: self)
    }()
    
    public var tableViewReloadDataBlock : TableViewReloadDataBlock?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
