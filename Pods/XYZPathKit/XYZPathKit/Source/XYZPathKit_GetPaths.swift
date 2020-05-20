//
//  XYZPathKit_GetPaths.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 
import XYZTimeKit

public func GetPathsInMusic(searchDepth:Int = 1) -> [Path] {
    if !userMusic.exists{try?  userMusic.createDirectory()}else{print("存在")}
    var textFiles = userMusic.find(searchDepth: searchDepth) { path in
        (
            Musiccontain判断函数Music(FilePath: path)
        )
    }
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
}



public func GetPathsInVideo(searchDepth:Int = 1) -> [Path] {
    if !userVideo.exists{try?  userVideo.createDirectory()}
    var textFiles = userVideo.find(searchDepth: searchDepth) { path in
        (
            Videocontain判断函数(FilePath: path)
        )
    }
    for i in textFiles{
        if i^ != userVideo{
            do {       try i ->> (userVideo + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = XYZTime.NowString + i.fileName
                    try i ->> (userVideo + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
    print("检测了！！！")
    print(textFiles)
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
}

public func GetPathsInPDF(searchDepth:Int = 1) -> [Path] {
    if !userPDF.exists{try?  userPDF.createDirectory()}else{print("存在")}
    var textFiles = userPDF.find(searchDepth: searchDepth) { path in
        PDFContain判断函数(FilePath: path)
    }
    
    for i in textFiles{
        if i^ != userPDF{
            do {       try i ->> (userPDF + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = XYZTime.NowString + i.fileName
                    try i ->> (userPDF + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
    print("检测了！！！")
    print(textFiles)
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
}
public func GetPathsInLMR(searchDepth:Int = 1) -> [Path] {
    if !userLMR.exists{try?  userLMR.createDirectory()}else{print("存在")}
    var textFiles = userLMR.find(searchDepth: searchDepth) { path in
        LMRContain判断函数(FilePath: path)
    }
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
}
public func GetPathsInZip(searchDepth:Int = 1) -> [Path] {
    if !userZip.exists{try?  userZip.createDirectory()}else{ print("存在")}
    var textFiles = userZip.find(searchDepth: searchDepth) { path in
        zipContain判断函数(FilePath: path)
    }
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
}
