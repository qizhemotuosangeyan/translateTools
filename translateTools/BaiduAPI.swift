//
//  BaiduAPI.swift
//  translateTools
//
//  Created by 千千 on 2019/10/5.
//  Copyright © 2019 千千. All rights reserved.
//

import UIKit
import SwiftHash

/// 记录参数
class BaiduAPI: NSObject {
    let appid = 20191004000339054
    let passwd = "rPWomwWvMOxrLd9nylnq"
    var salt = 1
    var from : String = "auto"
    var to : String  = "zh"
    var q : String = ""
    var sign : String = ""
    var params = ["":""]
    convenience init(toLanguage:String = "zh", question:String = "") {
        self.init()
        self.to = toLanguage
        self.q = question
        let hash : String = MD5(String(appid) + q + String(salt) + passwd).lowercased()
        let params = ["q":self.q,
                      "from":self.from,
                      "to":self.to,
                      "appid":String(self.appid),
                      "salt":String(self.salt),
                      "sign":hash] as [String : Any];
        self.params = params as! [String : String]
    }
    
}
