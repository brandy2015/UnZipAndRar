//
//  XYZFile.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import FileKit
import UIKit
import FileKit
import MediaPlayer
import AVFoundation
import SHTManager
//Path.pathExtension
//url.pathExtension
//Optional("mp4")

//Path.fileName
//("Glass Animals-Gooey.mp3")
//fileName.withoutExtension)

open class XYZFile: NSObject {
    
    public var FilePath  :Path?  = nil
    public var FileSize  :Double = 0.0
    public var CreateAt  :Date?   = Date()
    public var ModifiedAt:Date?   = Date()
    public var FileType  :String = ""
    public var FileExtension     = ""
    public var NameWithEx:String? = nil
    public var NameCutEx :String? = nil
    //    1GB=1024MB,1MB=1024KB,1KB=1024Bytes
    init(Pathx:Path) {
        
        self.FilePath   = Pathx
        self.FileSize   = Double(Pathx.fileSize ?? 0 )/(1024*1024)   //bytes to MB
        self.CreateAt   = Pathx.creationDate
        self.ModifiedAt = Pathx.modificationDate
        self.FileType   = Pathx.pathExtension
        self.FileExtension = Pathx.pathExtension
        self.NameWithEx = Pathx.fileName
        self.NameCutEx  = Pathx.fileNameCutEx
    }
}



extension AVMetadataItem{
    public static func ToInfoDic(metaData:[AVMetadataItem]) -> [String?:Any?]{
        var MP3Data : [String?:Any?] = [:]
        for metadataItem in metaData{
            if let key = metadataItem.commonKey?.rawValue ,let value = metadataItem.value{
                MP3Data[key] = value
            }
            if metadataItem.commonKey?.rawValue == "artwork"{
                print("获取了图片")
                if let artworkData = metadataItem.value as? Data{
                    MP3Data["artwork"] = artworkData
                }
            }else{
                print("没有图片！！")
            }
        }
        
        
        return MP3Data
    }
}



//extension Path{

//    public var XYZFileAttribute : FileAttributeType{
//        return 文件的基本属性(Pathx: self)
//    }
//    typealias FileAttributeType = (文件大小:Double,创建日期:Date?,修改日期:Date?,文件类型:String,文件名称含扩展名:String,文件名称不含扩展名:String)
//    public func 文件的基本属性(Pathx:Path) -> (文件大小:Double,创建日期:Date?,修改日期:Date?,文件类型:String,文件名称含扩展名:String,文件名称不含扩展名:String){
//        //        let dicAtt = Pathx.attributes
//        return (Double(Pathx.fileSize!)/(1024*1024),Pathx.creationDate,Pathx.modificationDate,Pathx.pathExtension,Pathx.fileName,String.去文件后缀(x:Pathx.fileName))
//    }

//}



public extension Path{
    
    public
    var fileNameCutEx: String {
        if fileName.contains("." + pathExtension){
            let x = fileName.replacingOccurrences(of:pathExtension, with: "")
            return x.replacingOccurrences(of:".", with: "")
        }else{
            print("没有后缀")
            return ""
        }
    }
    
}



public enum FileType:String {
    case Music
    case Video
    case PDF
    case Compression
    case LMR
    case Photo
    case unknowntype
    case Directory //文件路径
}


public func GetFileType(GivePath:Path) -> FileType {
    print("看type")
    if GivePath.pathExtension == ""{
        
        if GivePath.isDirectory{
            return FileType.Directory
        }else{
            return FileType.unknowntype
        }
        
        
    }
    
    if (
        GivePath.pathExtension.uppercased() == "MP3"   ||
            GivePath.pathExtension.uppercased() == "FLAC"  ||
            GivePath.pathExtension.uppercased() == "M4A"   ||
            GivePath.pathExtension.uppercased() == "WAV"   ||
            GivePath.pathExtension.uppercased() == "M4R"    ){
        
        return FileType.Music
        
    }
    
    if (GivePath.pathExtension.uppercased() == "MOV"  ||
        GivePath.pathExtension.uppercased() == "MP4"  ||
        GivePath.pathExtension.uppercased() == "AVI"  ||
        GivePath.pathExtension.uppercased() == "WMV"  ||
        GivePath.pathExtension.uppercased() == "MPG"  ||
        GivePath.pathExtension.uppercased() == "M4V"  ||
        GivePath.pathExtension.uppercased() == "MPG"  ||
        GivePath.pathExtension.uppercased() == "RMVB" ||
        GivePath.pathExtension.uppercased() == "MKV"  ||
        GivePath.pathExtension.uppercased() == "FLV"  ||
        GivePath.pathExtension.uppercased() == "3GP"  ){
        
        return FileType.Video
    }
    
    if (GivePath.pathExtension.uppercased() == "PDF"  ){
        return FileType.PDF
    }
    
    if (GivePath.pathExtension.uppercased() == "LMR"  ){
        return FileType.LMR
    }
    if (GivePath.pathExtension.uppercased() == "Zip"  ||
        GivePath.pathExtension.uppercased() == "RAR"  ){
        return FileType.Compression
    }
    
    if (GivePath.pathExtension.uppercased() == "PNG"  ||
        GivePath.pathExtension.uppercased() == "JPG"  ||
        GivePath.pathExtension.uppercased() == "JPEG" ||
        GivePath.pathExtension.uppercased() == "GIF"  ||
        GivePath.pathExtension.uppercased() == "BMP"  ){
        return FileType.Photo
    }
    
    return FileType.unknowntype
}
//class RecipeIngredient: Food {
//    public var quantity: Int
//    init(name: String, quantity: Int) {
//        self.quantity = quantity
//        super.init(name: name)
//    }
//    override convenience init(name: String) {
//        self.init(name: name, quantity: 1)
//    }
//}

