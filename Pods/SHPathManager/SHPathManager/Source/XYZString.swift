//
//  XYZString.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/2/23.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZString: NSObject {

}

public extension String{
      static func 去文件后缀(x s:String) -> String {
        var 空 = ""
        for i in s { if i != "."{ 空.append(i)}else{ break}}
        return 空
    }
}

public extension String{
      var withoutExtension: String{
        return String.去文件后缀x(x: self)
    }
      static func 去文件后缀x(x s:String) -> String {
        var 空 = ""
        for i in s { if i != "."{ 空.append(i)}else{ break}}
        return 空
    }
}



public extension String{
    
      func transformToPinYin(取代空格的东西:String = "") -> String{//(String,String){
        
        let mutableString = NSMutableString(string: self)
        
        //把汉字转为拼音
        
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        //去掉拼音的音标
        //        let 没有去掉音标 = mutableString
        
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        //去掉空格
        let 去掉空格 = string.replacingOccurrences(of: " ", with: 取代空格的东西)
        return 去掉空格//(去掉空格//,没有去掉音标 as String)
        
    }
    
}
