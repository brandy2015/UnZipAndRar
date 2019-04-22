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
    public var FileSizeX :FileSizeObject 
    public class FileSizeObject{
        
        public var FileSizeKB:Double = 0.0
        public var FileSizeMB:Double = 0.0
        public var FileSizeGB:Double = 0.0
        public var FileSizeTB:Double = 0.0
        init(fileSize: UInt64?) {
            self.FileSizeKB   = Double(fileSize ?? 0 )/(1024)   //bytes to KB
            self.FileSizeMB   = Double(fileSize ?? 0 )/(1024*1024)   //bytes to MB
            self.FileSizeGB   = Double(fileSize ?? 0 )/(1024*1024*1024)   //bytes to GB
            self.FileSizeTB   = Double(fileSize ?? 0 )/(1024*1024*1024*1024)   //bytes to TB
        }
    }
    
    
    public var CreateAt  :Date?   = Date()
    public var ModifiedAt:Date?   = Date()
    public var FileType  :String = ""
    public var FileExtension     = ""
    public var NameWithEx:String? = nil
    public var NameCutEx :String? = nil
    public var exists :Bool  = false
    
    //    1GB=1024MB,1MB=1024KB,1KB=1024Bytes
    public init(Pathx:Path) {
       
        self.FilePath   = Pathx
        self.FileSize   = Double(Pathx.fileSize ?? 0 )/(1024*1024)   //bytes to MB
        self.FileSizeX  = FileSizeObject(fileSize: Pathx.fileSize)
        self.CreateAt   = Pathx.creationDate
        self.ModifiedAt = Pathx.modificationDate
        self.FileType   = Pathx.pathExtension
        self.FileExtension = Pathx.pathExtension
        self.NameWithEx = Pathx.fileName
        self.NameCutEx  = Pathx.fileNameCutEx
        
        self.exists      = Pathx.exists
    }
    
    func removeProtection()  {
        self.FilePath?.url.RemoveProtection()
    }
    
}






public extension Path{
    
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


//锁屏后无法调用文件此方法处理文件可以访问
//处理文件Protection权限为None以便后台调用Music
public func 处理文件Protection权限为None以便后台调用Music(路径:[Path]) {
    for i in 路径{
        i.url.RemoveProtection()
        print("处理掉权限访问")
    }
}

public extension URL{
    
    func RemoveProtection() {
        let attributes:NSDictionary = NSDictionary(dictionary: [FileAttributeKey.protectionKey:FileProtectionType.none])
        do {try FileManager.default.setAttributes(attributes as! [FileAttributeKey : Any], ofItemAtPath: self.path)
        }catch{print("错误")}
    }
    
}

public func FileInMainBundle(Name:String,Type:String) -> String? {
    return Bundle.main.path(forResource: Name, ofType: Type)
}

public func FileInMainBundlePath(Name:String,Type:String) -> Path? {
    if let filePath = Bundle.main.path(forResource: Name, ofType: Type){
        return Path(filePath)
    }else{return nil}
}
