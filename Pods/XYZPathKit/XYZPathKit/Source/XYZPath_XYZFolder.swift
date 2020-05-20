
//
//  XYZPath_XYZFolder.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/22.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 
 
//文件路径会不断变化，沙箱路径会不断变化
public enum XYZFolderNameEnum:String {
    case UserDocument
    case Music
    case Video
    case PDF
    case Compression
    case AlreadyUnzip
    case LMR
    case Photo
    case userSecret
    case UnKnown
}


//转FolderName为枚举类型
public func GetFolderEnum(FolderString:String) -> XYZFolderNameEnum{
    return XYZFolderNameEnum.init(rawValue: FolderString) ?? .UserDocument
}

public func FilePath(FileName:String,FileFolder:XYZFolderNameEnum) -> Path {
    switch FileFolder {
    case .Music :       return userMusic + FileName
    case .PDF   :       return userPDF + FileName
    case .Video :       return userVideo + FileName
    case .Photo :       return userPic + FileName
    case .Compression:  return userZip + FileName
    case .AlreadyUnzip: return userAlreadyUnZip + FileName
    case .LMR:          return userLMR + FileName
    case .userSecret:   return userSecretFileFolder + FileName
    default:            return userDocument + FileName
    }
}
