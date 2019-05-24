//
//  FiveLabelViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/3.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class FiveLabelViewController: FourLabelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FiveLabelCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? FourLabelCell
        if cell == nil {
            cell = FiveLabelCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.model = (self.contentArray?.object(at: indexPath.row) as! BasicModel)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
