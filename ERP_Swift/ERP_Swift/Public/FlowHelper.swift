//
//  FlowHelper.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/3.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class FlowHelper: NSObject {
    func toDetlByFlowCatg(_ catg : FlowCatg, _ relateID : String) -> Void {
        let vc = GeneralDetailViewController()
        vc.relateID = relateID
        vc.catg = catg
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toContactDetailByStaffID(_ staffID : String) -> Void {
        let vc = ContactDetailViewController()
        vc.staffID = staffID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toContentDetailText(_ text : String) -> Void {
        let vc = GeneralTextViewViewController()
        vc.contentText = text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toContentDetailText(_ text : String, _ title : String) -> Void {
        let vc = GeneralTextViewViewController()
        vc.contentText = text
        vc.navTitle = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toContentDetailText(_ text : String, _ title : String, _ editDisable : Bool) -> Void {
        let vc = GeneralTextViewViewController()
        vc.contentText = text
        vc.navTitle = title
        vc.editDisable = editDisable
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    var navigationController : UINavigationController? {
        get {
            var parent: UIViewController?
            if let window = UIApplication.shared.delegate?.window,let rootVC = window?.rootViewController {
                parent = rootVC
                while (parent?.presentedViewController != nil) {
                    parent = parent?.presentedViewController!
                }
                
                if let tabbar = parent as? UITabBarController ,let nav = tabbar.selectedViewController as? UINavigationController {
                    return nav
                }else if let nav = parent as? UINavigationController {
                    return nav
                }
            }
            return nil
        }
    }
}
