//
//  XYZTime_SeparateDate.swift
//  XYZTimeKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

public extension Date{
    func SeparateDate() -> (Year:Int,Month:Int,Day:Int,Hour:Int,Min:Int,Sec:Int){
        let a = self.CurrentDateInRegion
        return (a.year,a.month,a.day,a.hour,a.minute,a.second)
    }
    
    func ToXYZInt(format:String = "yyyyMMddHHmmss") -> Int64  {
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = format
        // 使用日期格式器格式化日期、时间
        // 为日期格式器设置格式字符串
        let timeZone = TimeZone(abbreviation:  "UTC")
        dformatter.timeZone = timeZone
        let datestr = dformatter.string(from: date)
        let message =  "\(datestr)"
        return Int64(message) ?? Int64(0)
    }
}
    

