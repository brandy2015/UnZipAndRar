
//
//  XYZTimeCount.swift
//  SHTManager
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZTimeCount: NSObject {

}

public func j计算时间差剩余保护时间(时间保护的时间:Date) -> String  {
    //获取现在的时间
    let date1 = Date()
    let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
    return "\(interval)"
}


public func j计算时间差和返回是否受时间保护(时间保护的时间:Date) -> Bool  {
    
    var 是否受保护 = true
    //获取现在的时间
    let date1 = Date()
    let interval:TimeInterval = 时间保护的时间.timeIntervalSince(date1)
    if (interval as Double) <= 0{是否受保护 = false}
    return 是否受保护
}


