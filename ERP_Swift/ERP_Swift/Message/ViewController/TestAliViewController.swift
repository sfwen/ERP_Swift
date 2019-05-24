//
//  TestAliViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/17.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class TestAliViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view. 573121300156
        NetworkHelper.makePostRequest(baseUrl: "https://eco.taobao.com/router/rest/taobao.tbk.item.info.get", parameters:["num_iids":"573121300156" as NSObject, "platform" : NSNumber.init(value: 2)], needRequestHeader: false, successHandler: { (resp) in
            print(resp)
        }, errorMsgHandler: { (error) in
            print("错误" + error)
        }) { (error) in
            print(error)
        }
        
//        NetworkHelper.makeGetRequest(baseUrl: "http://gw.api.taobao.com/router/rest/taobao.products.get", parameters: ["fields" : "product_id,tsc,cat_name,name" as NSObject, "nick" : "淘小二" as NSObject], successHandler: { (resp) in
//            print(resp)
//        }, errorMsgHandler: { (error) in
//            print("错误" + error)
//        }) { (error) in
//            print(error)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
