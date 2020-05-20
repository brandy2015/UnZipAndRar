//
//  XYZPathKit_Bundle.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

public func FileInBundleString(fileName:String,fileEx:String) -> String?{
    return Bundle.main.path(forResource: fileName, ofType: fileEx)
}

public func FileInBundleURL(fileName:String,fileEx:String) -> URL?{
    return Bundle.main.url(forResource: fileName, withExtension: fileEx)
}

