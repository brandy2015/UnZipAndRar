//
//  XYZTimeKit_Ex_DateToString.swift
//  XYZTimeKit
//
//  Created by 张子豪 on 2020/4/6.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit



//Date转String

public extension Date{
   
    var XYZTimeString:String{
        return Date.XYZTimeToString(From: self)
    }
    
    static func XYZTimeToString(From XYZDate:Date,DateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat
        let convertedDate0 = dateFormatter.string(from: XYZDate)
        return convertedDate0
        //发现一个问题，我这里设置了时间格式，但是没有设置时间的地区，但是输出的时间却不再是零时区，自动变成东八区了，所以明白：DateFormatter这个对象虽然默认格式为空，但是时间格式却会默认使用系统地区时区，于是明白，非特殊情况（你要设置的时区和系统所在地时区不同），您只需设置时间格式，而不必设置时间地区（时区）
        
        
        
        //设置时间采用什么位置（默认采用设备的位置（locale））
        //设置为设备所在地时间
        //        dateFormatter.locale =  Locale.current
        //        dateFormatter.dateStyle = DateFormatter.Style.full
        //        let convertedDate1 = dateFormatter.string(from: now)
    }
    
    var XYZTimeNameString:String{
        return Date.XYZTimeToString(From: self, DateFormat:  Date.XYZDateStringType_AllForName)
    }
    
    var XYZTimePointString:String{
        return Date.XYZTimeToString(From: self, DateFormat:  Date.XYZDate_YearMonthString_Point)
    }
    
    
}


public extension Date{
    var sendTime发布时间转文字方法:String{
        return sendTime发布时间转文字方法(发布时间: self)
    }
    
    private func sendTime发布时间转文字方法(发布时间:Date) -> String {
        let date = DateFormatter()
        date.dateFormat = "Y.M.d H:mm"
        let datetostring = date.string(from: 发布时间)
        return datetostring
    }
    
}

//转String为Date
//func ToXYZDate(format:String = "yyyyMMddHHmmss") -> Date {
//    //处理给予的String时间的格式
//    var format2 = format
//    if self.count != format.count{
//        let 位置 = self.startIndex..<self.endIndex
//        format2 = String(format[位置])
//    }
//
//    let timeZone = TimeZone.init(identifier: "UTC")
//    let formatter = DateFormatter()
//    formatter.timeZone = timeZone
//    formatter.dateFormat = format2
//    let date = formatter.date(from: self) ?? XYZTime.Now
//
//    return date
//}
