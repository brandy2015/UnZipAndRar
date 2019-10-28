//
//  XYZPath.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/2/16.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import FileKit
import MediaPlayer
import AVFoundation
import SHTManager



class XYZPath: NSObject {
    static func FileInBundleString(fileName:String,fileEx:String) -> String?{
        return Bundle.main.path(forResource: fileName, ofType: fileEx)
    }
    static func FileInBundleURL(fileName:String,fileEx:String) -> URL?{
        return Bundle.main.url(forResource: fileName, withExtension: fileEx)
    }
  
}

public let userDocument     = Path.userDocuments
public let userCaches       = Path.userCaches
public let userLibrary      = Path.userLibrary
public let userDocumentChildenPath = Path.userDocuments.children()
public let userInbox        = Path.userDocuments   + "Inbox"
public let userTemp         = Path.userTemporary
public let userInbox1       = Path.userDocuments   + "Inbox1"
public let userCookies      = Path.userLibrary     + "Cookies"
public let userPreferences  = Path.userLibrary     + "Preferences"
public let userAlreadyUnZip = Path.userDocuments   + "alreadyUnZip"
public let userSecretFileFolder = Path.userLibrary + "SecretFileFolder"
public let AppSupport       = userLibrary          + "Application Support"
public let userRealmFolder  = Path.userLibrary     + "RealmFolder"
public let userWallPaper    = Path.userDocuments   + "WallPaper"
public let userRealmDataBase = Path.userDocuments  + "RealmDataBase"
public let userMusic        = Path.userDocuments   + "Music"
public let userFile         = Path.userDocuments   + "File"
public let userVideo        = Path.userDocuments   + "Video"
public let userPDF          = Path.userDocuments   + "PDF"
public let userLMR          = Path.userDocuments   + "LMR"
public let userZip          = Path.userDocuments   + "Zip"
public let userPic          = Path.userDocuments   + "Picture"


public func MoveFromInBox(To:Path) {
    if !userInbox.exists{print("不存在路径")}else{print(userInbox.children())
        do{
            for i in userInbox.children(){let originalName = i.fileName
                try i.moveFile(to: To + originalName)}
            print("移出成功")
        }catch{print("移出失败")}
    }
}
public func FromInboxToDocument()  {
    if userInbox.exists{
        for i in userInbox.children(){
            do {try i ->> userDocument}catch{print(error)}
        }
    }
}
public func MoveToMusic(searchDepth:Int = 1)  {
    if !userMusic.exists{try?  userMusic.createDirectory()}
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (
                path.pathExtension.uppercased() == "MP3"  ||
                path.pathExtension.uppercased() == "FLAC" ||
                path.pathExtension.uppercased() == "M4A"  ||
                path.pathExtension.uppercased() == "WAV"  ||
                path.pathExtension.uppercased() == "M4R"  ||
                path.pathExtension.uppercased() == "OGG"  ||
                path.pathExtension.uppercased() == "RAM"
        )
    }
    
    for i in textFiles{
        if i^ != userMusic{
            do {       try i ->> (userMusic + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (XYZTime.NowString + i.fileName)
                    try i ->> (userMusic + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}

public func MoveToVideo(searchDepth:Int = 1)  {
    if !userVideo.exists{try?  userVideo.createDirectory()}
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (
                path.pathExtension.uppercased() == "MOV"    ||
                path.pathExtension.uppercased() == "MP4"    ||
                path.pathExtension.uppercased() == "AVI"    ||
                path.pathExtension.uppercased() == "WMV"    ||
                path.pathExtension.uppercased() == "MPG"    ||
                path.pathExtension.uppercased() == "M4V"    ||
                path.pathExtension.uppercased() == "MPG"    ||
                path.pathExtension.uppercased() == "RMVB"   ||
                path.pathExtension.uppercased() == "MKV"    ||
                path.pathExtension.uppercased() == "FLV"    ||
                path.pathExtension.uppercased() == "3GP"    ||
                path.pathExtension.uppercased() ==  "MPG"   ||
                path.pathExtension.uppercased() ==  "RMVB"  ||
                path.pathExtension.uppercased() ==  "MKV"   ||
                path.pathExtension.uppercased() ==  "FLV"   ||
                path.pathExtension.uppercased() ==  "WMA"   ||
                path.pathExtension.uppercased() ==  "VOB"   ||
                path.pathExtension.uppercased() ==  "DIVX"
            
            
        )
    }
    for i in textFiles{
        //检查是不是userVideo中的视频是不移动，不是就移动到userVideo
        if i^ != userVideo{
            do {       try i ->> (userVideo + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (XYZTime.NowString + i.fileName)
                    try i ->> (userVideo + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}
public func MoveToPDF(searchDepth:Int = 1)  {
    if !userPDF.exists{try?  userPDF.createDirectory()}else{print("存在")}
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension.uppercased() == "PDF"  )
    }
    for i in textFiles{
        if i^ != userPDF{
            do {       try i ->> (userPDF + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (XYZTime.NowString + i.fileName)
                    try i ->> (userPDF + 新命名)
                }catch{print("移动失败")}
            }
        }
    }
}

public func MoveToLMR(searchDepth:Int = 1)  {
    if !userLMR.exists{try?  userLMR.createDirectory()}else{print("存在")}
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension.uppercased() == "LMR" )
    }
    for i in textFiles{
        if i^ != userLMR{
            do {       try i ->> (userLMR + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (XYZTime.NowString + i.fileName)
                    try i ->> (userLMR + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}

public func MoveToZip(searchDepth:Int = 1)  {
    if !userZip.exists{try?  userZip.createDirectory()}else{print("存在")}
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension.uppercased() == "ZIP" || path.pathExtension.uppercased() == "RAR" )
    }
    for i in textFiles{
        if i^ != userZip{
            do {       try i ->> (userZip + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (XYZTime.NowString + i.fileName)
                    try i ->> (userZip + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}

public func MoveToPic(searchDepth:Int = 1)  {
    if !userPic.exists{try?  userPic.createDirectory()}else{ print("存在")}
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (
                path.pathExtension.uppercased() == "PNG"  ||
                path.pathExtension.uppercased() == "JPG"  ||
                path.pathExtension.uppercased() == "JPEG" ||
                path.pathExtension.uppercased() == "GIF"  ||
                path.pathExtension.uppercased() == "BMP"
        )
    }
    for i in textFiles{
        if i^ != userPic{
            do {       try i ->> (userPic + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (XYZTime.NowString + i.fileName)
                    try i ->> (userPic + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}
public func GetPathsInMusic(searchDepth:Int = 1) -> [Path] {
    if !userMusic.exists{try?  userMusic.createDirectory()}else{print("存在")}
    var textFiles = userMusic.find(searchDepth: searchDepth) { path in
        (
                path.pathExtension.uppercased() == "MP3"  ||
                path.pathExtension.uppercased() == "FLAC" ||
                path.pathExtension.uppercased() == "M4A"  ||
                path.pathExtension.uppercased() == "WAV"  ||
                path.pathExtension.uppercased() == "M4R"  ||
                path.pathExtension.uppercased() == "OGG"  ||
                path.pathExtension.uppercased() == "RAM"
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
                path.pathExtension.uppercased() == "MOV"    ||
                path.pathExtension.uppercased() == "MP4"    ||
                path.pathExtension.uppercased() == "AVI"    ||
                path.pathExtension.uppercased() == "WMV"    ||
                path.pathExtension.uppercased() == "MPG"    ||
                path.pathExtension.uppercased() == "M4V"    ||
                path.pathExtension.uppercased() == "MPG"    ||
                path.pathExtension.uppercased() == "RMVB"   ||
                path.pathExtension.uppercased() == "MKV"    ||
                path.pathExtension.uppercased() == "FLV"    ||
                path.pathExtension.uppercased() == "3GP"    ||
                path.pathExtension.uppercased() ==  "MPG"   ||
                path.pathExtension.uppercased() ==  "RMVB"  ||
                path.pathExtension.uppercased() ==  "MKV"   ||
                path.pathExtension.uppercased() ==  "FLV"   ||
                path.pathExtension.uppercased() ==  "WMA"   ||
                path.pathExtension.uppercased() ==  "VOB"   ||
                path.pathExtension.uppercased() ==  "DIVX"

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
        (   path.pathExtension.uppercased() == "PDF"  )
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
        (path.pathExtension.uppercased() == "LMR")
    }
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
}
public func GetPathsInZip(searchDepth:Int = 1) -> [Path] {
    if !userZip.exists{try?  userZip.createDirectory()}else{ print("存在")}
    var textFiles = userZip.find(searchDepth: searchDepth) { path in
        (
            path.pathExtension.uppercased() == "ZIP" ||
                path.pathExtension.uppercased() == "RAR"
        )
    }
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
}
