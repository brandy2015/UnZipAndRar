//
//  XYZTimeKit.swift
//  XYZTimeKit
//
//  Created by 张子豪 on 2020/4/6.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 

public var XYZTime = XYZTimeKit()

public class XYZTimeKit:NSObject  {
    public var Now:Date{
        return Date()
    }
    
    public var NowString:String{
        return Date().XYZTimeString
    }
    
    public var NowNoZoneString:String{
        return "\(Date())"
    } 
}
