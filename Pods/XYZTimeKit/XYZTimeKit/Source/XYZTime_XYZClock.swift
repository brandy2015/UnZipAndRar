//
//  XYZTime_XYZClock.swift
//  XYZTimeKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 
class XYZTime_XYZClock: NSObject {
    func PrintClock()    {
        let interval: TimeInterval = (2.hours.timeInterval) + (34.minutes.timeInterval) + (5.seconds.timeInterval)
        let xxxs = interval.toClock() // "2:34:05"
        print(xxxs)
    }

}
//
//
//// Time Interval Formatting by Components
//let _ = interval.toString {
//    $0.maximumUnitCount = 4
//    $0.allowedUnits = [.day, .hour, .minute]
//    $0.collapsesLargestUnit = true
//    $0.unitsStyle = .abbreviated
//} // "2h 34m"
