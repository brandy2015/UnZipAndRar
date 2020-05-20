//
//  XYZTime_XYZDate_CountDays.swift
//  XYZTimeKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

public extension Date{
    
    var j计算时间差剩余保护时间x:String{
        return j计算时间差剩余保护时间(时间保护的时间: self)
    }
    
    var j计算时间差和返回是否受时间保护:Bool{
        return j计算时间差和返回是否受时间保护(时间保护的时间: self)
    }
    
    
    
    private func j计算时间差剩余保护时间(时间保护的时间:Date) -> String  {
        //获取现在的时间
        let date1 = Date()
        let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
        return "\(interval)"
    }
    
    
    private func j计算时间差和返回是否受时间保护(时间保护的时间:Date) -> Bool  {
        
        var 是否受保护 = true
        //获取现在的时间
        let date1 = Date()
        let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
        if (interval as Double) <= 0{是否受保护 = false}
        return 是否受保护
    }
    
    
    
}
