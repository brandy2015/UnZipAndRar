//
//  SHPath.swift
//  SHPathManager
//
//  Created by 张子豪 on 2018/5/16.
//  Copyright © 2018年 张子豪. All rights reserved.
//

import UIKit
import FileKit
import MediaPlayer
import AVFoundation
import SHTManager

//锁屏后无法调用文件此方法处理文件可以访问
//处理文件Protection权限为None以便后台调用Music
public func 处理文件Protection权限为None以便后台调用Music(路径:[Path]) {
    for i in 路径{
        let attributes:NSDictionary = NSDictionary(dictionary: [FileAttributeKey.protectionKey:FileProtectionType.none])
        do {try FileManager.default.setAttributes(attributes as! [FileAttributeKey : Any], ofItemAtPath: i.url.path)
        }catch{print("错误")}
    }
}

public extension String{
    public static func 去文件后缀(x s:String) -> String {
        var 空 = ""
        for i in s { if i != "."{ 空.append(i)}else{ break}}
        return 空
    }
}


