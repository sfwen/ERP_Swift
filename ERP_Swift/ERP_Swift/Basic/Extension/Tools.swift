//
//  Tools.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/15.
//  Copyright © 2018年 Land. All rights reserved.
//

import Foundation
import KeychainAccess

let kUserInfoKey = "UserInfo"


class Tools: NSObject {
    //MARK: - 获取IP
    public func getIPAddresses() -> String? {
        var addresses = [String]()
        
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while (ptr != nil) {
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            if let address = String(validatingUTF8:hostname) {
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }
        return addresses.first
    }
    
    private let kKeyChainUUIDIdentifier = "com.ERP.uuid";
    
    /// 获取UUID
    public func getUUID() -> String? {
        var uuidString: String = ""
        let items = Keychain.allItems(.genericPassword)
        var itemsGroupedByService: [String: [[String: Any]]]?
        
        itemsGroupedByService = groupBy(items) { item -> String in
            let service = item["service"] as? String
            if service == kKeyChainUUIDIdentifier {
                return service!
            }
            return ""
        }
        
        let services = Array(itemsGroupedByService!.keys)
        for service in services {
            let data = Keychain(service: service).allItems()
            for dict in data {
                let s = dict["service"] as? String
                if s == kKeyChainUUIDIdentifier {
                    let value = dict["value"] as? String
                    uuidString = value!
                    break
                } else {
                    continue
                }
            }
        }
        
        if uuidString.isEmpty {
            let keychain = Keychain(service: kKeyChainUUIDIdentifier)
            let value = getOriginUUID()
            keychain["uuid"] = value
            uuidString = value
        }
        return uuidString
    }
    
    private func groupBy<C: Collection, K: Hashable>(_ xs: C, key: (C.Iterator.Element) -> K) -> [K:[C.Iterator.Element]] {
        var gs: [K:[C.Iterator.Element]] = [:]
        for x in xs {
            let k = key(x)
            var ys = gs[k] ?? []
            ys.append(x)
            gs.updateValue(ys, forKey: k)
        }
        return gs
    }
    
    private func getOriginUUID() -> String {
        let puuid = CFUUIDCreate( nil );
        let uuidString = CFUUIDCreateString(nil, puuid);
        return uuidString! as String
    }
    
    /// 保存登录信息
    func saveInfo(info :String) {
        let userDefault = UserDefaults.standard
        userDefault.set(info, forKey: kUserInfoKey)
        
//        userDefault.setValue(info, forKey: kUserInfoKey)
//         1. 归档
//        let data = NSKeyedArchiver.archivedData(withRootObject: info)
//        userDefault.set(data, forKey: kUserInfoKey)
//        print("保存成功")
        userDefault.synchronize()
    }
    
    // 读取
    func readInfo() -> String {
        let userDefault = UserDefaults.standard
        let info = userDefault.object(forKey: kUserInfoKey)
        if info != nil {
            return info as! String
        }
        
//        let infoData = userDefault.data(forKey: kUserInfoKey)
//
//        if (infoData != nil) {
//            let info = NSKeyedUnarchiver.unarchiveObject(with: infoData!)
//            return info!
//        }
        return ""
    }
    
    // 删除
    func deleteInfo() {
        let useDefault = UserDefaults.standard
        useDefault.removeObject(forKey: kUserInfoKey)
    }
    
    func getOssUrlStrr(_ pathStr : String) -> URL {
        if pathStr.hasPrefix("http") {
            return URL.init(string: pathStr)!
        } else {
            let newPath = "https://lanting-storager.oss-cn-hangzhou.aliyuncs.com/" + pathStr
            return URL.init(string: newPath)!
        }
    }
}

extension NSObject {
    // MARK: 字典转字符串
    func dicValueString(_ dic:[String : Any]) -> String?{
        let data = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str
    }
    
    // MARK: 字符串转字典
    func stringValueDic(_ str: String) -> [String : Any]?{
        let data = str.data(using: String.Encoding.utf8)
        if let dict = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any] {
            return dict
        }
        return nil
    }
    
    /**
     字典转换为JSONString
     
     - parameter dictionary: 字典参数
     
     - returns: JSONString
     */
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
}

func BoolToStr(_ boolValue : Bool) -> String {
    return boolValue == true ? "是" : "否"
}
