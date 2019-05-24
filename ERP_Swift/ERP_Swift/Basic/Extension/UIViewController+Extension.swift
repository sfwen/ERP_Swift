//
//  UIViewController+Extension.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/6.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChildViewController(_ childVC: UIViewController, toView: UIView) {
        childVC.beginAppearanceTransition(true, animated: false)
        toView.addSubview(childVC.view)
        childVC.endAppearanceTransition()
        childVC.didMove(toParentViewController: self)
    }
    
    func addRightMoreItem() -> Void {
        let rightBarItem = UIBarButtonItem.init(image: UIImage.init(named: "menu_expand"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(land_showMenu))
        rightBarItem.tintColor = UIColor.Color_Text_Orange()
        self.navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc func land_showMenu() -> Void {
        print("land_showMenu")
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "删除", style: UIAlertActionStyle.destructive, handler: nil)
        let archiveAction = UIAlertAction(title: "保存", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
