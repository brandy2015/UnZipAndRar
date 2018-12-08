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
    public  static let YearMonthDayString = "yyyyMMdd"
    public  static let YearMonthString = "yyyyMM"
    public  static let YearString = "yyyy"
}


public class SHTManager: NSObject {
    
    public  static var SoHowTimeZone = 8.hours
    
    public  static var Now: Date { return SHTManager.TodayTime() }
    public  static var NowString: String { return Date.ToString(date: SHTManager.TodayTime())}
    public  static var TodayStart: Date {
        return ThisDayStartTime(date: Now)
    }
//        SHTManager.TodayTime(date: Now, format: "yyyyMMdd") }
    
    
    public  static var TodayEnd: Date { return TodayStart + 1.days - 1.seconds}
    
    
    
    public  static var ThisYearStart: Date { return SHTManager.ThisYearStartTime() }
    public  static var ThisYearEnd: Date { return SHTManager.ThisYearEndTime() }
    public  static var ThisMonthStart: Date { return SHTManager.ThisMonthStartTime() }
    public  static var ThisMonthEnd: Date { return SHTManager.ThisMonthEndTime(date: Now) }
    
    
    
    
    
    public  static var NextMonthStart: Date { return ThisMonthStart + 1.months }
    public  static var NextMonthEnd: Date { return ThisMonthEnd + 1.months }
    public  static var PreviousMonthStart: Date { return ThisMonthStart - 1.months }
    public  static var PreviousMonthEnd: Date { return ThisMonthEnd - 1.months }
    
    
    public  static var YesterdayStart: Date { return SHTManager.TodayStart - 1.days }
    public  static var YesterdayEnd: Date { return SHTManager.TodayEnd - 1.days}
    public  static var TomorrowStart: Date { return SHTManager.TodayStart + 1.days}
    public  static var TomorrowEnd: Date { return  SHTManager.TodayEnd + 1.days }
    
    
    //////返回即时时间()
    public class func TodayTime() -> Date{
        return Date() + SoHowTimeZone
        // 创建一个日期格式器
//        let a = "\(Date.ToInt(date: date))"
//        let b = String.ToDate(dateString: a)
        
        
//        let dformatter = DateFormatter()
//        dformatter.dateFormat = format
//        // 使用日期格式器格式化日期、时间
//        let datestr = dformatter.string(from:date)
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = .long
//        dateFormatter.dateFormat = format
//        let timeZone = TimeZone(abbreviation:  "UTC")
//        dateFormatter.timeZone=timeZone
//        let outputB = dateFormatter.date(from: "\(Date.ToInt(date: date))")
//
//        return outputB!
    }
    
    //本日开始日期
    public class func ThisDayStartTime(date:Date = Now)-> Date{
        // 创建一个日期格式器
        
        let a = Date.ToInt(date: date)/1000000
        let b = String.ToDate(dateString: "\(a)")
        return b
    }
    
    //本日终结日期
    public class func ThisDayEndTime(date:Date = Now)-> Date{
        // 创建一个日期格式器
        return ThisDayStartTime(date: date) + 1.days - 1.seconds
//        let a = Date.ToInt(date: date)/1000000
//        print(a)
//        let b = String.ToDate(dateString: "\(a)")
//
//        print(b)
//        return b
    }
    
    
    
    //本年开始日期
    public class func ThisYearStartTime(date:Date = Now)-> Date{
        // 创建一个日期格式器
        
        let a = Date.ToInt(date: date)/10000000000
        print(a)
        let b = String.ToDate(dateString: "\(a)")
        
        print(b)
        return b
//        let dformatter = DateFormatter()
//        // 为日期格式器设置格式字符串
//        let format:String = "yyyy"
//        dformatter.dateFormat = format
//        // 使用日期格式器格式化日期、时间
//        let datestr = dformatter.string(from: date)
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = .long
//        dateFormatter.dateFormat = "yyyy"
//        let timeZone = TimeZone(abbreviation:  "UTC")
//        dateFormatter.timeZone=timeZone
//        let outputB = dateFormatter.date(from: datestr) ?? Now
//        return outputB
    }
     public class func ThisYearEndTime(date:Date = SHTManager.ThisYearStartTime())-> Date{
        return date + 1.years - 1.seconds
    }
    
    public class func ThisMonthStartTime(date:Date = Now) -> Date{
        // 创建一个日期格式器
        let a = Date.ToInt(date: date)/100000000
//        print(a)
        let b = String.ToDate(dateString: "\(a)")
        
//        print(b)
        return b
//        print("Start\n转换前的时间是")
//        print(date)
//        let dformatter = DateFormatter()
//        // 为日期格式器设置格式字符串
//        let format:String = "yyyyMM"
//        dformatter.dateFormat = format
//        // 使用日期格式器格式化日期、时间
//        let datestr = dformatter.string(from: date)
//
//        print("Start\n转换前奏")
//        print(datestr)
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = .short
//        dateFormatter.dateFormat = "yyyyMM"
//        let timeZone = TimeZone(abbreviation:  "UTC")
//        dateFormatter.timeZone=timeZone
//        let outputB = dateFormatter.date(from: datestr) ?? Now
        
        
//        print("Start\n转换后奏")
//        print(outputB)
//        return outputB
    }
    
    public class func ThisMonthEndTime(date:Date) -> Date{
        let date1 = ThisMonthStartTime(date: date)
        return  date1 + 1.months - 1.seconds
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
    public class func CountCurrentMonthDays(month:Date = SHTManager.Now) -> Int {
        return  SHTManager.ThisMonthStartTime(date: month).monthDays
    }
    
    
    //起始时间到月末有多少天
    public class func CountCurrentDayToMonthEndDays(Day:Date = SHTManager.Now) -> Double {
   
        let t = SHTManager.GetNextMonthStart(date: Day).timeIntervalSince(Day)/24/3600
        return t
    }
    
}

public extension String{
    //转String为Date
    public  static func ToDate(dateString:String,format:String = "yyyyMMddHHmmss") -> Date {
        //处理给予的String时间的格式
        var format2 = format
        if dateString.count != format.count{
           let 位置 = dateString.startIndex..<dateString.endIndex
            format2 = String(format[位置])
        }

        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = format2
        let date = formatter.date(from: dateString) ?? SHTManager.Now
        
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
    
    public func 时间格式的调整(date:Date,format:String = "yyyy年MM月dd日 HH:mm:ss") -> String  {
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = format
        // 使用日期格式器格式化日期、时间
        let datestr = dformatter.string(from: date)
        let message =  "\(datestr)"
        return message
    }
    
    //转Date为String
    public  static func ToString(date:Date,format:String = "yyyyMMddHHmmss") -> String {
        
        let nowDate = date//Now
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        //    formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = format//"yyyy-MM-dd HH:mm"
        
        let date = formatter.string(from: nowDate)
        return date //date.components(separatedBy: " ").first!
    }
    
    public  static func ToInt(date:Date,format:String = "yyyyMMddHHmmss") -> Int64  {
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = format
        // 使用日期格式器格式化日期、时间
        // 为日期格式器设置格式字符串
        let timeZone = TimeZone(abbreviation:  "UTC")
        dformatter.timeZone=timeZone

        let datestr = dformatter.string(from: date)
        let message =  "\(datestr)"


        return Int64(message) ?? Int64(0)
    }
    
    public  static func SeparateDate(time:Date) -> (Year:Int,Month:Int,Day:Int,Hour:Int,Min:Int,Sec:Int){
        let FullTime = Date.ToInt(date: time) 
        
       
     
        let Year  = FullTime/10000000000
        let Month = (FullTime/100000000)%100
        let Day   = (FullTime/1000000)%100
        let Hour  = (FullTime/10000)%100
        let Min   = (FullTime/100)%100
        let Sec   = (FullTime)%100
        
        return (Int(Year),Int(Month),Int(Day),Int(Hour),Int(Min),Int(Sec))
    }
}
