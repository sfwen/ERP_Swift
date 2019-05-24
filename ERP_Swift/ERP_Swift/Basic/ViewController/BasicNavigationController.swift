//
//  BasicNavigationController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class BasicNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.view.backgroundColor = UIColor.white
            let backItem = UIBarButtonItem.init(image: UIImage.init(named: "new_back_btn"), style: UIBarButtonItemStyle.done, target: self, action: #selector(popViewController(animated:)))
            backItem.tintColor = UIColor.black
            viewController.navigationItem.leftBarButtonItem = backItem
        }
        super.pushViewController(viewController, animated: true)
    }

}
