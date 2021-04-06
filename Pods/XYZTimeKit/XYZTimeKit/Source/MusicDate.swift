//
//  MusicDate.swift
//  XYZTimeKit
//
//  Created by zhangzihao on 2021/3/11.
//  Copyright © 2021 张子豪. All rights reserved.
//

import Foundation

public extension Float64{
   
   var ToString分秒:String{
       return 处理显示的数字(Seconds: self)
   }
   private func 处理显示的数字(Seconds:Float64) -> String {
       var 分钟位 = "00"
       if Int(Seconds)/60 < 10 {
           分钟位 = "0" + "\(Int(Seconds)/60)"
       }else{
           分钟位 = "\(Int(Seconds)/60)"
       }
       var 秒钟位 = "00"
       if Int(Seconds)%60 < 10 {
           秒钟位 = "0" + "\(Int(Seconds)%60)"
       }else{
           秒钟位 = "\(Int(Seconds)%60)"
       }
       return 分钟位 + ":" + 秒钟位
   }

}



