//
//  XYZTime_GoToAnotherDate.swift
//  XYZTimeKit
//
//  Created by 张子豪 on 2020/4/6.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 

public extension Date{
    static var CurrentRegion:Region{
        return Region(calendar: Calendars.gregorian, zone: Zones.current, locale: Locales.current)
    }
    var XYZDateInregion :DateInRegion{
        let CurrentRegion = Region(calendar: Calendars.gregorian, zone: Zones.current, locale: Locales.current)
        let XYZDateInRegion = DateInRegion(self, region: CurrentRegion)
        return XYZDateInRegion
    }
 
    var CurrentDateInRegion :DateInRegion{
        let CurrentRegion = Region(calendar: Calendars.gregorian, zone: Zones.current, locale: Locales.current)
        let XYZDateInRegion = DateInRegion(self, region: CurrentRegion)
        return XYZDateInRegion
    }
    
    /// 操作时间
    /// - Parameter GoTo: 要对时间操作的动作
    /// - Returns: 返回包含时区信息的时间
    func XYZDateGoTo(GoTo:DateRelatedType) -> DateInRegion {
        return self.XYZDateInregion.dateAt(GoTo)
        
    }
    
}

public extension Date{
    /// DayStart日期的日开始时间
    var StartOfDayInRegion :DateInRegion{ return XYZDateGoTo(GoTo: .startOfDay)}
    var StartOfDay         :Date        { return StartOfDayInRegion.date         }
    /// DayEnd日期的日结束时间
    var EndOfDayInRegion   :DateInRegion{ return XYZDateGoTo(GoTo: .endOfDay)}
    var EndOfDay           :Date        { return EndOfDayInRegion.date}
    
    /// 日期的月开始时间
    var StartOfMonthRegion :DateInRegion{ return XYZDateGoTo(GoTo: .startOfMonth)}
    var StartOfMonth       :Date        { return StartOfMonthRegion.date         }
    /// 日期的月结束时间
    var EndOfMonthRegion   :DateInRegion{ return XYZDateGoTo(GoTo: .endOfMonth)}
    var EndOfMonth         :Date        { return EndOfMonthRegion.date }
    
    /// YearStart日期的年开始时间
    var StartOfYearRegion  :DateInRegion{ return XYZDateGoTo(GoTo: .prevYear) + 1.years}
    var StartOfYear        :Date        { return StartOfYearRegion.date         }
    /// YearEnd日期的年结束时间
    var EndOfYearRegion    :DateInRegion{ return XYZDateGoTo(GoTo: .nextYear) - 1.seconds }
    var EndOfYear          :Date        { return EndOfYearRegion.date }
    
    
}


public extension Date{
    /// NextDay日期的日开始时间
    var NextDayInRegion        :DateInRegion{ return XYZDateGoTo(GoTo: .tomorrow)        }
    var NextDayStart           :Date        { return NextDayInRegion.date.StartOfDay       }
    var NextDayEnd             :Date        { return NextDayInRegion.date.EndOfDay         }
    /// PreviousDay日期的日结束时间
    var PreDayInRegion         :DateInRegion{ return XYZDateGoTo(GoTo: .yesterday)       }
    var PreDayStart            :Date        { return PreDayInRegion.date.StartOfDay   }
    var PreDayEnd              :Date        { return PreDayInRegion.date.EndOfDay     }
    
    /// NextMonth日期的日结束时间
    var NextMonRegion          :DateInRegion{ return XYZDateGoTo(GoTo: .nextMonth)       }
    var NextMonStart           :Date        { return NextMonRegion.date.StartOfDay     }
    var NextMonEnd             :Date        { return NextMonRegion.date.EndOfMonth     }
    /// PreviousMonth日期的日结束时间
    var PreMonRegion           :DateInRegion{ return XYZDateGoTo(GoTo: .prevMonth)       }
    var PreMonStart            :Date        { return PreMonRegion.date.StartOfDay }
    var PreMonEnd              :Date        { return PreMonRegion.date.EndOfMonth }
    
    
    //数一个月有多少天
    var monthDays:Int{
        return self.CurrentDateInRegion.monthDays
    }
    
    //数今天到这月末有多少天
    var CountDaysEndToMonth:Int{
        return self.CurrentDateInRegion.monthDays - self.day
    }
    
    
    
    
}


public extension Date{
    var TestDate1:Date{
        return PreMonStart
    }
    var TestDate2:Date{
        return PreMonEnd
    }
    
    var TestDate3:Date{
        return PreDayEnd
    }
}
 
