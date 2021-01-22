//
//  XYZPathKit_ManipulatePath.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 
import XYZTimeKit
 


//Rename FileName
public extension Path{
    
    func RenameFile(NewName:String) {
        let CurrentFilePath = self
        let fatherPath = CurrentFilePath^
        let NewPath = fatherPath + NewName
        let newname2 = "1" + NewName//这里是重命名
        let NewPath2 = fatherPath + newname2
        do {
            try CurrentFilePath ->> NewPath
        }catch{
            print("重命名失败因为有重名")
            try? CurrentFilePath ->> NewPath2
        }
        
    }
}

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
        Musiccontain判断函数Music(FilePath: path)
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
        Videocontain判断函数(FilePath: path)
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
        PDFContain判断函数(FilePath: path)
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
        LMRContain判断函数(FilePath: path)
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
        zipContain判断函数(FilePath: path)
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
        PicContain判断函数(FilePath: path)
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

public func 检测Pic文件并移至Pic文件夹(searchDepth:Int = 1)  {
    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in  path.isPic}
    
    for i in textFiles{
        if i^ != userPic{
            do {
                try i ->> (userPic + i.fileName)
            }catch{print("再次尝试移动")
                do {
                    let newFileName = UUID().uuidString + "." + i.pathExtension
                    let newFilePath = userPic + newFileName
                    try i ->> newFilePath
                }catch{print("移动失败")}
            }
        }else{ /* print(i.fileName + "在Music中")*/}
    }
}
