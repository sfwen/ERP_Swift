//
//  NetworkHelper.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/15.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftyJSONMappable
import NVActivityIndicatorView
import Device

/*
 * 配置你的网络环境
 */
enum  NetworkEnvironment{
    case Development
    case Test
    case Distribution
}

let CurrentNetWork : NetworkEnvironment = .Development
/// 基础服务
private var kBasicURL = ""

private func judgeNetwork(network : NetworkEnvironment = CurrentNetWork) {
    if (network == .Development) {
        kBasicURL = "https://dv.lantingroup.cn:8074/Mobile"
    } else if(network == .Test) {
        kBasicURL = "https://dv.lantingroup.cn:8075/Mobile"
    } else {
        kBasicURL = ""
    }
}

protocol NetworkToolDelegate {
    // 登录请求
    static func goToLogin(userName:String,password:String,completionHandler: @escaping(_ dict:[String : AnyObject]) -> (), errorHandler: @escaping(_ errorMsg : String) ->(), networkFailHandler: @escaping(_ error : Error) -> ())
    //GET 请求
    static func makeGetRequest(baseUrl : String,parameters : [String:AnyObject],successHandler: @escaping(_ json:JSON) ->(),errorMsgHandler : @escaping(_ errorMsg : String) ->(),networkFailHandler:@escaping(_ error : Error) -> ())
    
    //POST 请求
    static func makePostRequest(baseUrl : String, parameters : [String : NSObject], needRequestHeader : Bool, successHandler: @escaping(_ json:JSON) ->(),errorMsgHandler : @escaping(_ errorMsg : String) ->(),networkFailHandler:@escaping(_ error : Error) -> ())
    
    /*  图片上传 请求
     * imageData : 图片二进制数组
     */
    static func upDataIamgeRequest(baseUrl : String,parameters : [String : String],imageArr : [UIImage],successHandler: @escaping(_ dict:JSON) ->(),errorMsgHandler : @escaping(_ errorMsg : String) -> (),networkFailHandler: @escaping(_ error:Error) -> ())
    
}

extension NetworkToolDelegate {
    // 图片上传
    static func upDataIamgeRequest(baseUrl : String,parameters : [String : String],imageArr : [UIImage],successHandler: @escaping(_ dict:JSON) ->(),errorMsgHandler : @escaping(_ errorMsg : String) -> (),networkFailHandler: @escaping(_ error:Error) -> ()){
        
        judgeNetwork();
        
        let URL = kBasicURL + baseUrl
        
        let userCookies = UserDefaults.standard.object(forKey: "userCookies")
        
        var header : [String : String]?
        
        if(userCookies != nil){
            
            header = ["Cookie":"\(userCookies!)","Set-Cookie":"\(userCookies!)","X-Requested-With":"XMLHttpRequest","Content-Type" : "application/json; charset=utf-8"]
            
        }
        
        if(imageArr.count == 0){
            
            return;
        }
        
        let image = imageArr.first;
        let imageData = UIImageJPEGRepresentation(image!, 0.5)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(imageData!, withName: "file", fileName: "file.jpg", mimeType: "image/jpeg")
            //如果需要上传多个文件,就多添加几个
            //multipartFormData.append(imageData, withName: "file", fileName: "123456.jpg", mimeType: "image/jpeg")
            //......
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: URL, method: .post, headers: header) { (encodingResult) in
            
            // print(encodingResult)
            switch encodingResult {
            case .success(let upload, _, _):
                //连接服务器成功后，对json的处理
                upload.responseJSON { response in
                    //解包
                    guard let value = response.result.value else { return }
                    let json = JSON(value)
                    //  print(json)
                    // 请求成功 但是服务返回的报错信息
                    guard json["errorCode"].intValue == 0 else {
                        
                        if(json["errorCode"].intValue == 50000){ // Token 过期重新登录
                            
                            errorMsgHandler(json["errorMsg"].stringValue)
                            
//                            SVProgressHUD.showInfo(withStatus: "授权失效,请重新登录!")
                            
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
                                NotificationCenter.default.post(name: NSNotification.Name(rawValue: RELOGIN_NOTIFY), object: nil)
                            }
                            return
                        }
                        
                        errorMsgHandler(json["errorMsg"].stringValue)
                        return
                    }
                    
                    if json["result"].dictionary != nil{
                        
                        successHandler(json["result"])
                        return
                    }else{
                        
                        successHandler(json)
                        return
                    }
                }
                /*
                 //获取上传进度
                 upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                 print("图片上传进度: \(progress.fractionCompleted)")
                 }
                 */
                
            case .failure(let encodingError):
                
                networkFailHandler(encodingError)
                //打印连接失败原因
                //  print(encodingError)
                
            }
        }
    }
    
    // Get 请求
    static func makeGetRequest(baseUrl : String,parameters : [String:AnyObject],successHandler: @escaping(_ json:JSON) ->(),errorMsgHandler : @escaping(_ errorMsg : String) ->(),networkFailHandler:@escaping(_ error : Error) -> ()){
        
        judgeNetwork();
        
        var URL = kBasicURL + baseUrl
        if baseUrl.hasPrefix("http") {
            URL = baseUrl
        }
        
        let dict = parameters
        
        let userCookies = UserDefaults.standard.object(forKey: "userCookies")
        
        
        var header : [String : String]?
        
        if(userCookies != nil){
            
            header = ["Cookie":"\(userCookies!)","Set-Cookie":"\(userCookies!)","X-Requested-With":"XMLHttpRequest"]
            
        }
        
        Alamofire.request(URL, method: .get, parameters: dict, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            
            print("resopnse===\(response)")
            // 网络连接或者服务错误的提示信息
            guard response.result.isSuccess else
            { networkFailHandler(response.error!); return }
            
            if let value = response.result.value {
                let json = JSON(value)
                // 请求成功 但是服务返回的报错信息
                guard json["errorCode"].intValue == 0 else {
                    
                    if(json["errorCode"].intValue == 50000){ // Token 过期重新登录
                        
                        errorMsgHandler(json["errorMsg"].stringValue)
                        
//                        SVProgressHUD.showInfo(withStatus: "授权失效,请重新登录!")
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5) {
                            
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: RELOGIN_NOTIFY), object: nil)
                        }
                        return
                    }
                    
                    errorMsgHandler(json["errorMsg"].stringValue)
                    
                    return
                }
                
                if json["result"].dictionary != nil{
                    
                    successHandler(json["result"])
                    return
                }else{
                    
                    successHandler(json)
                    return
                }
            }
        }
    }
    
    static func makePostRequest(baseUrl : String, parameters : [String : NSObject], needRequestHeader : Bool, successHandler: @escaping(_ json:JSON) ->(),errorMsgHandler : @escaping(_ errorMsg : String) ->(),networkFailHandler:@escaping(_ error : Error) -> ()){
        
//        let manager = SessionManager.default
//        manager.delegate.sessionDidReceiveChallenge = {
//            session,challenge in
//            return    (URLSession.AuthChallengeDisposition.useCredential,URLCredential(trust:challenge.protectionSpace.serverTrust!))
//        }
        
        judgeNetwork();
        
        var URL = kBasicURL + baseUrl
        if baseUrl.hasPrefix("http") {
            URL = baseUrl
        }
        
//        let userCookies = UserDefaults.standard.object(forKey: "userCookies")
//        var header : [String : String]?
//        if(userCookies != nil){
//
//            header = ["Cookie":"\(userCookies!)","Set-Cookie":"\(userCookies!)","X-Requested-With":"XMLHttpRequest","Content-Type" : "application/json; charset=utf-8"]
//
//        }
        
        var requestMultDict = parameters
        
        if needRequestHeader {
            let sessionDict = NSMutableDictionary()
            sessionDict.setValue(currUserInfo.Session.SessionID, forKey: "SessionID")
            sessionDict.setValue(currUserInfo.Session.LoginStafPosID, forKey: "LoginStafPosID")
            requestMultDict["Session"] = sessionDict
        } else {
            let sessionDict = NSMutableDictionary()
            sessionDict.setValue(currUserInfo.Session.SessionID, forKey: "SessionID")
            requestMultDict["session"] = sessionDict
        }
        
        print("请求地址：" + "\n" + URL)
        print("请求参数：")
        print(requestMultDict)
        // JSONEncoding 与 URLEncoding 服务接受数据的区别
        Alamofire.request(URL, method: .post, parameters: needRequestHeader ? ["request":requestMultDict] : requestMultDict, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            print(response.response?.allHeaderFields as Any)
//            print(response);
            // 网络连接或者服务错误的提示信息
            guard response.result.isSuccess else {
                networkFailHandler(response.error!);
                return
            }
            
            if let value = response.result.value {
                let json = JSON(value)
                //  print(json)
                // 请求成功 但是服务返回的报错信息
                guard json["IsSuccess"].boolValue == true else {
                    let type = json["Type"].intValue
                    
                    if (type == 3 || type == 2) { // Token 过期重新登录
                        print(json["PromptText"].stringValue)
                        errorMsgHandler(json["PromptText"].stringValue)
//                        SVProgressHUD.showInfo(withStatus: "授权失效,请重新登录!")
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: RELOGIN_NOTIFY), object: nil)
                        }
                        return
                    }
                    
                    errorMsgHandler(json["errorMsg"].stringValue)
                    return
                }
                if json["result"].dictionary != nil {
                    successHandler(json["result"])
                    return
                } else {
                    successHandler(json)
                    return
                }
            }
        }
    }
    
    
    static func goToLogin(userName:String,password:String,completionHandler: @escaping(_ dict:[String : AnyObject]) -> (), errorHandler: @escaping(_ errorMsg : String) ->(), networkFailHandler: @escaping(_ error : Error) -> ()){
        judgeNetwork();
        let url = kBasicURL + GeneralLogin_API
        
//        let dict = ["username":userName,"password":password,"apt":"3"]
        let param = NSMutableDictionary.init()
        param.setValue(userName, forKey: "Username")
        let password :String = password + "Land2009"
        param.setValue(password.md5, forKey: "Password")
        
        let infoDictionary = Bundle.main.infoDictionary!
        let majorVersion = infoDictionary["CFBundleShortVersionString"]//主程序版本号
        //        let minorVersion = infoDictionary["CFBundleVersion"]//版本号（内部标示）
        let appVersion = majorVersion as! String
        let iosversion :String = UIDevice.current.systemVersion //ios系统版本
        
        let clientInfo = ClientInfo(json: "")
        clientInfo.DeviceName = appVersion + "【" + Device.version().rawValue + "】"
        clientInfo.OS = "iOS" + iosversion
        let tools = Tools.init()
        clientInfo.IP = tools.getIPAddresses()!
        clientInfo.DeviceTag = tools.getUUID()!
        
        let dict = NSMutableDictionary.init()
        dict.setValue(clientInfo.DeviceTag, forKey: "DeviceTag")
        dict.setValue(clientInfo.IP, forKey: "IP")
        dict.setValue(clientInfo.OS, forKey: "OS")
        dict.setValue(clientInfo.DeviceName, forKey: "DeviceName")
        param.setValue(dict, forKey: "ClientInfo")
        
        print("请求地址：" + "\n" + url)
        let paramStr = tools.dicValueString(param as! [String : Any])
        print("请求参数：" + "\n" + paramStr!)
        Alamofire.request(url, method: .post, parameters: ["request":param], encoding:JSONEncoding.default, headers: nil).responseJSON { (response) in
//            print(response)
            
            // 网络连接或者服务错误的提示信息
            guard response.result.isSuccess else
            { networkFailHandler(response.error!); return }
            // 保存 cookies
            let headerFields = response.response?.allHeaderFields as! [String : String]
            let userCookie =  headerFields["Set-Cookie"]
            // print("userCookie>>>>>>\(userCookie ?? "0000000")")
            UserDefaults.standard.set(userCookie, forKey: "userCookies")
            UserDefaults.standard.synchronize()
            
            if let value = response.result.value {
                let json = JSON(value)
                print(json)
                // 请求成功 但是服务返回的报错信息
                guard json["IsSuccess"].bool == true else { errorHandler(json["PromptText"].stringValue); return }
                print("成功")
                completionHandler(value as! [String : AnyObject])
//                let result = tools.dicValueString(json as! [String : Any])
//                if let resultDict = json.dictionary {
//                    tools.saveInfo(info: value)
//
//                    completionHandler(resultDict as [String : AnyObject])
//                }
//                completionHandler(json.dictionary! as [String : AnyObject])
//                if let resultDict = json["result"].dictionary {
//                    completionHandler(resultDict as [String : AnyObject])
//                }
            }
        }
    }
}

struct NetworkHelper: NetworkToolDelegate {}
