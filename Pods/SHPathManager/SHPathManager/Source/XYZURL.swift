//
//  XYZURL.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/2/23.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import FileKit
class XYZURL: NSObject {}
public func fileToURL(_ file: String) -> URL? {
    // Get the full path of the file
    let fileComponents = file.components(separatedBy: ".")
    guard let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) else{return nil}
    return URL(fileURLWithPath: filePath)
}
extension String{var ToURL :URL{return URL(fileURLWithPath: self)}}
public func PathsToURLs(Paths:[Path]) -> [URL] {
    var BackURLs = [URL]()
    for i in Paths{ BackURLs.append(i.url)}
    return BackURLs
}
