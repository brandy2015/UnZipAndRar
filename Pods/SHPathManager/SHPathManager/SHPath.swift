//
//  SHPath.swift
//  SHPathManager
//
//  Created by 张子豪 on 2018/5/16.
//  Copyright © 2018年 张子豪. All rights reserved.
//

import UIKit
import FileKit
import MediaPlayer
import AVFoundation
import SHTManager
//检测音乐文件并移至Music文件夹()
//检测视频文件并移至video文件夹()
//检测PDF文件并移至PDF文件夹()
//检测Zip文件并移至Zip文件夹()
//检测LMR文件并移至LMR文件夹()
//检测Pic文件并移至Pic文件夹()





public  let userDocument = Path.userDocuments
public  let userCaches = Path.userCaches
public  let userLibrary = Path.userLibrary
public  let userDocumentChildenPath = Path.userDocuments.children()
public  let userInbox = Path.userDocuments + "Inbox"
public  let userTemp = Path.userTemporary
public  let userInbox1 = Path.userDocuments + "Inbox1"
public  let userCookies = Path.userLibrary + "Cookies"
public  let userPreferences = Path.userLibrary + "Preferences"
public let userAlreadyUnZip = Path.userDocuments + "alreadyUnZip"

public let userSecretFileFolder = Path.userLibrary + "SecretFileFolder"
public let AppSupport =  userLibrary + "Application Support"
public let userRealmFolder = Path.userLibrary + "RealmFolder"



public  let userWallPaper = Path.userDocuments + "WallPaper"

public  let userRealmDataBase = Path.userDocuments + "RealmDataBase"

public let userMusic = Path.userDocuments + "Music"
public let userFile = Path.userDocuments + "File"
public let userVideo = Path.userDocuments + "Video"
public let userPDF = Path.userDocuments + "PDF"

public let userLMR = Path.userDocuments + "LMR"
public let userZip = Path.userDocuments + "Zip"
public let userPic = Path.userDocuments + "Picture"


public func MoveFileFromUserInbox()  {
    if userInbox.exists{
        for i in userInbox.children(){
            do {try i ->> userDocument}catch{print(error)}
        }
    }
}
public func 检测音乐文件并移至Music文件夹(searchDepth:Int = 1)  {
    
    if !userMusic.exists{try?  userMusic.createDirectory()}
    
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "mp3"  || path.pathExtension == "MP3"  ||
            path.pathExtension == "flac" || path.pathExtension == "FLAC" ||
            path.pathExtension == "m4a"  || path.pathExtension == "M4A"  ||
            path.pathExtension == "wav"  || path.pathExtension == "WAV"  ||
            path.pathExtension == "m4r"  || path.pathExtension == "M4R")
    }
    
    for i in textFiles{
        if i^ != userMusic{
            do {       try i ->> (userMusic + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
                    
                    
                    
                    
                    
                    try i ->> (userMusic + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}

public func 检测视频文件并移至video文件夹(searchDepth:Int = 1)  {
    
    
    if !userVideo.exists{try?  userVideo.createDirectory()}
    
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        
        (path.pathExtension == "mov" || path.pathExtension == "MOV"   ||
            path.pathExtension == "mp4"  || path.pathExtension == "MP4"  ||
            path.pathExtension == "avi"  || path.pathExtension == "AVI"  ||
            path.pathExtension == "wmv"  || path.pathExtension == "WMV"  ||
            path.pathExtension == "mpg"  || path.pathExtension == "MPG"  ||
            path.pathExtension == "m4v"  || path.pathExtension == "M4V"  ||
            path.pathExtension == "mpg"  || path.pathExtension == "MPG"  ||
            path.pathExtension == "rmvb" || path.pathExtension == "RMVB" ||
            path.pathExtension == "mkv"  || path.pathExtension == "MKV"  ||
            path.pathExtension == "flv"  || path.pathExtension == "FLV"  ||
            path.pathExtension == "3gp"  || path.pathExtension == "3GP")
    }
    
    
    
    for i in textFiles{
        if i^ != userVideo{
            do {       try i ->> (userVideo + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
                    try i ->> (userVideo + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
    
    
}


public func 检测PDF文件并移至PDF文件夹(searchDepth:Int = 1)  {
    
    if !userPDF.exists{try?  userPDF.createDirectory()}else{
        print("存在")
    }
    
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "pdf"  || path.pathExtension == "PDF"  )
    }
    
    for i in textFiles{
        if i^ != userPDF{
            do {       try i ->> (userPDF + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
                    try i ->> (userPDF + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}


public func 检测LMR文件并移至LMR文件夹(searchDepth:Int = 1)  {
    
    if !userLMR.exists{try?  userLMR.createDirectory()}else{
        print("存在")
    }
    
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "LMR"  || path.pathExtension == "lmr"  )
    }
    
    for i in textFiles{
        if i^ != userLMR{
            do {       try i ->> (userLMR + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
                    try i ->> (userLMR + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}

public func 检测Zip文件并移至Zip文件夹(searchDepth:Int = 1)  {
    
    if !userZip.exists{try?  userZip.createDirectory()}else{
        print("存在")
    }
    
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "Zip"  || path.pathExtension == "zip" || path.pathExtension == "ZIP" ||
            path.pathExtension == "RAR"  || path.pathExtension == "rar" || path.pathExtension == "Rar"
            
        )
    }
    
    for i in textFiles{
        if i^ != userZip{
            do {       try i ->> (userZip + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
                    try i ->> (userZip + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}

public func 检测Pic文件并移至Pic文件夹(searchDepth:Int = 1)  {
    
    if !userPic.exists{try?  userPic.createDirectory()}else{
        print("存在")
    }
    
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "png"  || path.pathExtension == "PNG" || path.pathExtension == "jpg"  || path.pathExtension == "JPG" ||
            
            path.pathExtension == "jpeg"  || path.pathExtension == "JPEG" ||
            path.pathExtension == "gif"  || path.pathExtension == "GIF" ||
            path.pathExtension == "bmp"  || path.pathExtension == "BMP"
        )
    }
    
    for i in textFiles{
        if i^ != userPic{
            do {       try i ->> (userPic + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
                    try i ->> (userPic + 新命名)
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}





public func 检测Music文件夹中的Music(searchDepth:Int = 1) -> [Path] {
    
    if !userMusic.exists{try?  userMusic.createDirectory()}else{
        print("存在")
    }
    
    var textFiles = userMusic.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "mp3"  || path.pathExtension == "MP3"  ||
            path.pathExtension == "flac" || path.pathExtension == "FLAC" ||
            path.pathExtension == "m4a"  || path.pathExtension == "M4A"  ||
            path.pathExtension == "wav"  || path.pathExtension == "WAV"  ||
            path.pathExtension == "m4r"  || path.pathExtension == "M4R" )
    }
    //        print("检测了！！！")
    //        print(textFiles)
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
    
  
    
}


public func 检测Video文件夹中的Video(searchDepth:Int = 1) -> [Path] {
    if !userVideo.exists{try?  userVideo.createDirectory()}
    
    var textFiles = userVideo.find(searchDepth: searchDepth) { path in
        
        (path.pathExtension == "mov" || path.pathExtension == "MOV"   ||
            path.pathExtension == "mp4"  || path.pathExtension == "MP4"  ||
            path.pathExtension == "avi"  || path.pathExtension == "AVI"  ||
            path.pathExtension == "wmv"  || path.pathExtension == "WMV"  ||
            path.pathExtension == "mpg"  || path.pathExtension == "MPG"  ||
            path.pathExtension == "m4v"  || path.pathExtension == "M4V"  ||
            path.pathExtension == "mpg"  || path.pathExtension == "MPG"  ||
            path.pathExtension == "rmvb" || path.pathExtension == "RMVB" ||
            path.pathExtension == "mkv"  || path.pathExtension == "MKV"  ||
            path.pathExtension == "flv"  || path.pathExtension == "FLV"  ||
            path.pathExtension == "3gp"  || path.pathExtension == "3GP")
    }
    
    
    
    for i in textFiles{
        if i^ != userVideo{
            do {       try i ->> (userVideo + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
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

public func 检测PDF文件夹中的PDF(searchDepth:Int = 1) -> [Path] {
    if !userPDF.exists{try?  userPDF.createDirectory()}else{
        print("存在")
    }
    
    var textFiles = userPDF.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "pdf"  || path.pathExtension == "PDF"  )
    }
    
    for i in textFiles{
        if i^ != userPDF{
            do {       try i ->> (userPDF + i.fileName)}catch{print("再次尝试移动")
                do {
                    let 新命名 = (Date.ToString(date: SHTManager.Now) + i.fileName)
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

public func 检测lmr文件夹中的lmr(searchDepth:Int = 1) -> [Path] {
    
    if !userLMR.exists{try?  userLMR.createDirectory()}else{
        print("存在")
    }
    
    var textFiles = userLMR.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "lmr"  || path.pathExtension == "LMR"  ||
            path.pathExtension == "Lmr")
    }
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    return textFiles
    
}



public func 检测zip文件夹中的zip(searchDepth:Int = 1) -> [Path] {
    
    if !userZip.exists{try?  userZip.createDirectory()}else{
        print("存在")
    }
    
    var textFiles = userZip.find(searchDepth: searchDepth) { path in
        (   path.pathExtension == "zip"  || path.pathExtension == "Zip"  || path.pathExtension == "ZIP" ||
            path.pathExtension == "RAR"  || path.pathExtension == "rar" || path.pathExtension == "Rar"
            
        )
    }
    textFiles.sort { (s1, s2) -> Bool in
        s1.creationDate! > s2.creationDate!
    }
    //        print("检测了！！！")
    //        print(textFiles)
    return textFiles
    
}







//锁屏后无法调用文件此方法处理文件可以访问

public func 处理文件Protection权限为None以便后台调用Music(路径:[Path]) {
    for i in 路径{
        let attributes:NSDictionary = NSDictionary(dictionary: [FileAttributeKey.protectionKey:FileProtectionType.none])
        do {try FileManager.default.setAttributes(attributes as! [FileAttributeKey : Any], ofItemAtPath: i.url.path)
        }catch{print("错误")}
    }
}


public extension String{
    public static func 去文件后缀(x s:String) -> String {
        var 空 = ""
        for i in s { if i != "."{ 空.append(i)}else{ break}}
        return 空
    }
}




public func 文件的基本属性(Pathx:Path) -> (文件大小:Double,创建日期:Date?,修改日期:Date?,文件类型:String,文件名称含扩展名:String,文件名称不含扩展名:String){
    //        let dicAtt = Pathx.attributes
    return (Double(Pathx.fileSize!)/(1024*1024),Pathx.creationDate,Pathx.modificationDate,Pathx.pathExtension,Pathx.fileName,String.去文件后缀(x:Pathx.fileName))
}

public func 获取mp3的所有信息(Pathx:Path,ImagePlaceHolder:UIImage) -> (播放长度:Double,singer:String,song:String,image:UIImage,albumName:String,albumArt: MPMediaItemArtwork){
    
    
    let mp3Asset = AVURLAsset(url: Pathx.url, options: nil)
    var singer = ""//歌手
    var song = ""//歌曲名
    var image = ImagePlaceHolder //图片
    var albumName = ""//专辑名
    for format in mp3Asset.availableMetadataFormats{
        for metadataItem in mp3Asset.metadata(forFormat: format){
            if metadataItem.commonKey?.rawValue == "title"{
                song = metadataItem.value as! String //歌曲名
            }else if metadataItem.commonKey?.rawValue == "artist"{
                singer = metadataItem.value as! String
            }else if metadataItem.commonKey?.rawValue == "albumName"{
                albumName = metadataItem.value as! String
            }else if metadataItem.commonKey?.rawValue == "artwork"{
                if let dic = metadataItem.value as? Data{
                    
                    if let imagex = UIImage(data:dic){
                        image = imagex
                    }
                    
                }
                
            }}}
    
    //专辑封面
    let mySize = CGSize(width: 400, height: 400)
    
    
    var albumArt : MPMediaItemArtwork!
    
    guard #available(iOS 10.1, *) else {
        return (mp3Asset.duration.seconds,singer,song,image,albumName,albumArt)//iOS 10 以下系统就直接返回
    }
    
    albumArt = MPMediaItemArtwork(boundsSize:mySize) { sz in
        return image
    }
    
    
    return  (mp3Asset.duration.seconds,singer,song,image,albumName,albumArt)
}

public func PresentShareView(VC:UIViewController? = nil,TVC:UITableViewController? = nil,Nac:UINavigationController? = nil,文件地址:[URL],显示的框:UIView){
    
    let activityController = UIActivityViewController(activityItems: 文件地址, applicationActivities: nil)
    let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.message, UIActivity.ActivityType.mail, UIActivity.ActivityType.print, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToTencentWeibo]
    activityController.excludedActivityTypes = excludedActivities
    activityController.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
    activityController.popoverPresentationController?.sourceView = 显示的框
//    activityController
    
    if let VC = VC{
        
        VC.present(activityController, animated: true, completion: nil)
    }
    if let TVC = TVC{
        TVC.present(activityController, animated: true, completion: nil)
        
    }
    if let Nac = Nac{
        Nac.present(activityController, animated: true, completion: nil)
        
    }
    
}

public func SHPathXshare批量分享功能(文件地址:[URL],显示的框:UIView) -> UIActivityViewController?{
    //    let fileURL = 文件地址
    let activityController = UIActivityViewController(activityItems: 文件地址, applicationActivities: nil)
    let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.message, UIActivity.ActivityType.mail, UIActivity.ActivityType.print, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToTencentWeibo]
    activityController.excludedActivityTypes = excludedActivities
    activityController.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
    activityController.popoverPresentationController?.sourceView = 显示的框
    
    return activityController
}

public func 判断Inbox中是否有文件并移出到(从Path:Path,移到路径:Path) {
    if !userInbox.exists{print("不存在路径")}else{print(userInbox.children())
        do{
            for i in userInbox.children(){let originalName = i.fileName
                try i.moveFile(to: 移到路径 + originalName)}
            print("移出成功")
        }catch{print("移出失败")}
    }
}



public func 生成cachesPathStringURL路径(设定路径:String = "")  -> URL{
    return URL(fileURLWithPath: "\((Path.userCaches + 设定路径).absolute)")
}

public func 生成cachesPathString路径(设定路径:String = "")  -> String{
    return "\((Path.userCaches + 设定路径).absolute)"
}


public func 生成cachesPath路径(设定路径:String = "")  -> Path{ return  Path.userCaches}

public func path路径数组转URL路径数组(Path数组:[Path]) -> [URL] {
    var 返回URL数组 = [URL]()
    for i in Path数组{ 返回URL数组.append(i.url)}
    return 返回URL数组
}


public extension Path{
    
    public var fileNameWithoutEx: String {
        if fileName.contains("." + pathExtension){
            let x = fileName.replacingOccurrences(of:pathExtension, with: "")
            
            return x.replacingOccurrences(of:".", with: "")
        }else{
            print("没有后缀")
            return ""
        }
        
    }
    
}

