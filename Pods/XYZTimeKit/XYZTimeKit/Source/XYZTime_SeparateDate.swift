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
    



//extension Date{
//
//    var YearInt : Int{
//        return self.SeparateDate().Year
//    }
//    var MonthInt : Int{
//        return self.SeparateDate().Month
//    }
//    var DayInt : Int{
//        return self.SeparateDate().Day
//    }
//    var HourInt : Int{
//        return self.SeparateDate().Hour
//    }
//    var MinInt : Int{
//        return self.SeparateDate().Min
//    }
//    var SecInt : Int{
//        return self.SeparateDate().Sec
//    }
//
//
//
//    var YearString : String{
//        return "\(self.SeparateDate().Year)"
//    }
//    var MonthString : String{
//
//        if self.SeparateDate().Month < 10 {
//            return "0" + "\(self.SeparateDate().Month)"
//        }else{
//            return "\(self.SeparateDate().Month)"
//        }
//    }
//    var DayString : String{
//
//        if self.SeparateDate().Day < 10 {
//            return "0" + "\(self.SeparateDate().Day)"
//        }else{
//            return "\(self.SeparateDate().Day)"
//        }
//
//    }
//    var HourString : String{
//        if self.SeparateDate().Hour < 10 {
//            return "0" + "\(self.SeparateDate().Hour)"
//        }else{
//            return "\(self.SeparateDate().Hour)"
//        }
//
//    }
//    var MinString : String{
//
//        if self.SeparateDate().Min < 10 {
//            return "0" + "\(self.SeparateDate().Min)"
//        }else{
//            return "\(self.SeparateDate().Min)"
//        }
//
//    }
//    var SecString : String{
//        if self.SeparateDate().Sec < 10 {
//            return "0" + "\(self.SeparateDate().Sec)"
//        }else{
//            return "\(self.SeparateDate().Sec)"
//        }
//    }
//    var 日时分 : String{
//        return "\(self.DayInt)日 \(self.HourInt):" + self.MinString
//    }
//
//}
