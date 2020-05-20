//
//  XYZTime_XYZDate_FromString.swift
//  XYZTimeKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit 

extension String{
    //    static var XYZDateStringType_AllForName = "yyyyMMddHHmmss"
    //
    //    static var XYZDateStringType_All = "yyyy-MM-dd HH:mm:ss"
    //
    //    static let XYZDate_YearMonthDayString = "yyyyMMdd"
    //    static let XYZDate_YearMonthString = "yyyyMM"
    //    static let XYZDate_YearString = "yyyy"
    //
    //    static let XYZDate_YearMonthDayString_ = "yyyy-MM-dd"
    //    static let XYZDate_YearMonthString_ = "yyyy-MM"
    
    var DateStyleString:String? {
        let DateStringType =  [Date.XYZDateStringType_AllForName,Date.XYZDateStringType_All,Date.XYZDate_YearMonthDayString,Date.XYZDate_YearMonthString,Date.XYZDate_YearString,Date.XYZDate_YearMonthDayString_,Date.XYZDate_YearMonthString_]
        for i in DateStringType{
            if self.count == i.count {
                print("哈哈哈")
                print(i)
                return i
                
            }
        }
        print("执行到了这里")
        return nil
    }
    
    func XYZDateInRegion() -> DateInRegion? {
        guard let DateStyleString = self.DateStyleString else {return nil}
        return self.toDate(DateStyleString, region: Date.CurrentRegion)
    }
    
    func XYZDate() -> Date? {
        guard let DateStyleString = DateStyleString else {return nil}
        return self.toDate(DateStyleString, region: Date.CurrentRegion)?.date
    }
}


//public extension String{
//    
//    func XYZDate(dateFormat:String = "yyyy-MM-dd HH:mm:ss") -> Date? {
//        let formatter = DateFormatter()
//        formatter.locale = .current
//        //            Locale.init(identifier: "zh_CN")
//        formatter.dateFormat = dateFormat
//        let date = formatter.date(from: self)
//        
//        return date
//    }
//    
//}
