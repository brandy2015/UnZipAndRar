//
//  TimeManager.swift
//  TimeManager
//
//  Created by 张子豪 on 2018/5/9.
//  Copyright © 2018年 张子豪. All rights reserved.
//

import UIKit
import SwiftDate

public extension String{
    static let YearMonthDayString = "yyyyMMdd"
    static let YearMonthString = "yyyyMM"
    static let YearString = "yyyy"

    static let YearMonthDayString_ = "yyyy-MM-dd"
    static let YearMonthString_ = "yyyy-MM"

}


public class XYZTime: NSObject {
    
    public static var SoHowTimeZone = 8.hours
    public static var Now: Date {
        return Date() + SoHowTimeZone
    }
    public  static var NowString: String {
        return Now.XYZToString()}
    
    public  static var TodayStart: Date {
        return ThisDayStartTime(date: Now)
    }
    
    public  static var TodayEnd: Date { return TodayStart + 1.days - 1.seconds}
    
    
    
    public  static var ThisYearStart: Date { return XYZTime.ThisYearStartTime() }
    public  static var ThisYearEnd: Date { return XYZTime.ThisYearEndTime() }
    public  static var ThisMonthStart: Date { return XYZTime.ThisMonthStartTime() }
    public  static var ThisMonthEnd: Date { return XYZTime.ThisMonthEndTime(date: Now) }
    
    
    
    
    
    public  static var NextMonthStart: Date { return ThisMonthStart + 1.months }
    public  static var NextMonthEnd: Date { return ThisMonthEnd + 1.months }
    public  static var PreviousMonthStart: Date { return ThisMonthStart - 1.months }
    public  static var PreviousMonthEnd: Date { return ThisMonthEnd - 1.months }
    
    
    public  static var YesterdayStart: Date { return XYZTime.TodayStart - 1.days }
    public  static var YesterdayEnd: Date { return XYZTime.TodayEnd - 1.days}
    public  static var TomorrowStart: Date { return XYZTime.TodayStart + 1.days}
    public  static var TomorrowEnd: Date { return  XYZTime.TodayEnd + 1.days }
    
    
    
    //本日开始日期
    public class func ThisDayStartTime(date:Date = Now)-> Date{
        // 创建一个日期格式器
        
        let a = date.ToXYZInt()/1000000
        let b = "\(a)".ToXYZDate()//String.ToDate(dateString: "\(a)".ToXYZDate())
        return b
    }
    
    //本日终结日期
    public class func ThisDayEndTime(date:Date = Now)-> Date{
        // 创建一个日期格式器
        return ThisDayStartTime(date: date) + 1.days - 1.seconds
    }
    
    
    
    //本年开始日期
    public class func ThisYearStartTime(date:Date = Now)-> Date{
        // 创建一个日期格式器
        
        let a = date.ToXYZInt()/10000000000
        let b = "\(a)".ToXYZDate()//String.ToDate(dateString: )
        print(b)
        return b
    }
    
     public class func ThisYearEndTime(date:Date = XYZTime.ThisYearStartTime())-> Date{
        return date + 1.years - 1.seconds
    }
    
    public class func ThisMonthStartTime(date:Date = Now) -> Date{
        // 创建一个日期格式器
        let a = date.ToXYZInt()/100000000
        let b = "\(a)".ToXYZDate()//String.ToDate(dateString: )
        return b
    }
    
    public class func ThisMonthEndTime(date:Date) -> Date{
        return  ThisMonthStartTime(date: date) + 1.months - 1.seconds
    }
    
    
    //得到下一个月
    public  class func GetNextMonth(date:Date) -> Date {
        return date + 1.months
    }
    public  class func GetNextMonthStart(date:Date = Now) -> Date {
        return ThisMonthStartTime(date: date) + 1.months
    }
    public  class func GetNextMonthEnd(date:Date) -> Date {
        return ThisMonthEndTime(date: date) + 1.months
    }
    public  class func GetPreviousMonth(date:Date) -> Date {
        return date - 1.months
    }
    public  class func GetPreviousMonthStart(date:Date) -> Date {
        return ThisMonthStartTime(date: date) - 1.months
    }
    public  class func GetPreviousMonthEnd(date:Date) -> Date {
        return ThisMonthEndTime(date: date) - 1.months
    }
    
    
    //得到下一个月
   public class func GetNextDay(date:Date) -> Date {
        return date + 1.days
    }
   public class func GetNextDayStart(date:Date = Now) -> Date {
        return ThisDayStartTime(date: date) + 1.days
    }
   public class func GetNextDayEnd(date:Date) -> Date {
        return ThisDayEndTime(date: date) + 1.days
    }
   public class func GetPreviousDay(date:Date) -> Date {
        return date - 1.days
    }
   public class func GetPreviousDayStart(date:Date) -> Date {
        return ThisDayStartTime(date: date) - 1.days
    }
   public class func GetPreviousDayEnd(date:Date) -> Date {
        return ThisDayEndTime(date: date) - 1.days
    }
    //时间差值
    //判断这个月多少天
    public class func CountCurrentMonthDays(month:Date = XYZTime.Now) -> Int {
        return  XYZTime.ThisMonthStartTime(date: month).monthDays
    }
    
    
    //起始时间到月末有多少天
    public class func CountCurrentDayToMonthEndDays(Day:Date = XYZTime.Now) -> Double {
   
        let t = XYZTime.GetNextMonthStart(date: Day).timeIntervalSince(Day)/24/3600
        return t
    }
    
}

public extension String{
    //转String为Date
    func ToXYZDate(format:String = "yyyyMMddHHmmss") -> Date {
        //处理给予的String时间的格式
        var format2 = format
        if self.count != format.count{
           let 位置 = self.startIndex..<self.endIndex
            format2 = String(format[位置])
        }

        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = format2
        let date = formatter.date(from: self) ?? XYZTime.Now
        
        return date
    }
    
//    public  static func TimeFomatChange(date:Date,format:String = "yyyyMMddHHmmss") -> String  {
//        // 创建一个日期格式器
//        let dformatter = DateFormatter()
//        // 为日期格式器设置格式字符串
//        dformatter.dateFormat = format
//        // 使用日期格式器格式化日期、时间
//        let datestr = dformatter.string(from: date)
//        let message =  "\(datestr)"
//        return message
//    }
    
}

public extension Date{
    //转Date为String
    func XYZToString(format:String = "yyyyMMddHHmmss") -> String {
        //        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = .current
        //    formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = format//"yyyy-MM-dd HH:mm"
        return formatter.string(from: self)
    }
    
    //日期 -> 字符串
    func date2String(dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        //            Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: self)
        return date
    }
    
    //转Date为String
//    func XYZToString(format:String = "yyyyMMddHHmmss") -> String {
//        let timeZone = TimeZone.init(identifier: "UTC")
//        let formatter = DateFormatter()
//        formatter.timeZone = timeZone
//        //    formatter.locale = Locale.init(identifier: "zh_CN")
//        formatter.dateFormat = format//"yyyy-MM-dd HH:mm"
//        return formatter.string(from: self)
//    }
//
////    public var XYZToString:String {
////        let format:String = "yyyyMMddHHmmss"
////        let timeZone = TimeZone.init(identifier: "UTC")
////        let formatter = DateFormatter()
////        formatter.timeZone = timeZone
////        //    formatter.locale = Locale.init(identifier: "zh_CN")
////        formatter.dateFormat = format//"yyyy-MM-dd HH:mm"
////        let date = formatter.string(from: self)
////        return date
////    }
//
//
//
//    func 时间格式的调整(format:String = "yyyy年MM月dd日 HH:mm:ss") -> String  {
//        // 创建一个日期格式器
//        let dformatter = DateFormatter()
//        // 为日期格式器设置格式字符串
//        dformatter.dateFormat = format
//        // 使用日期格式器格式化日期、时间
//        return dformatter.string(from: self)
//    }
    

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
    
    func SeparateDate( ) -> (Year:Int,Month:Int,Day:Int,Hour:Int,Min:Int,Sec:Int){
        let FullTime = self.ToXYZInt()
        let Year  = FullTime/10000000000
        let Month = (FullTime/100000000)%100
        let Day   = (FullTime/1000000)%100
        let Hour  = (FullTime/10000)%100
        let Min   = (FullTime/100)%100
        let Sec   = (FullTime)%100
        return (Int(Year),Int(Month),Int(Day),Int(Hour),Int(Min),Int(Sec))
    }


    
    func sendTime发布时间转文字方法() -> String {
        let date = DateFormatter()
        date.dateFormat = "Y.M.d H:mm"
        return date.string(from: self)
    }
    
    func 时间格式的调整2只剩年月日时间创建录音() -> String  {
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = "yyyyMMddHHmmss"
        // 使用日期格式器格式化日期、时间
        return dformatter.string(from: self)
    }
    
    
//    //日期 -> 字符串
//    func date2String(dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> String {
//        let formatter = DateFormatter()
//        formatter.locale = .current
////
////            Locale.init(identifier: "zh_CN")
//        formatter.dateFormat = dateFormat
//        let date = formatter.string(from: self)
//        return date
//    }
}



extension String{
    func String2date(dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.locale = .current
        //            Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: self)
        
        return date
    }
}
