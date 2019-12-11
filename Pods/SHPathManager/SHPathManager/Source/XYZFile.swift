//
//  XYZFile.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/1/22.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import FileKit
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
        }else{print("没有后缀");return ""}
    }
}

public enum FileType:String {case Music,Video,PDF,Compression,LMR,Photo,unknowntype,Directory}//文件路径

public func GetFileType(GivePath:Path) -> FileType {
    guard GivePath.pathExtension != "" else {return GivePath.isDirectory ? .Directory : .unknowntype}
    switch GivePath.pathExtension.uppercased() {
        case "MP3","FLAC","M4A","WAV","M4R": return .Music
        case "MOV","MP4","AVI","WMV","MPG","M4V","RMVB","MKV","FLV","3GP": return .Video
        case "PDF": return .PDF
        case "LMR": return .LMR
        case "Zip","RAR": return .Compression
        case "PNG","JPG","JPEG","GIF","BMP": return .Photo
        default:return .unknowntype
    }
}

//锁屏后无法调用文件此方法处理文件可以访问
//处理文件Protection权限为None以便后台调用Music
public func 处理文件Protection权限为None以便后台调用Music(路径:[Path]) { for i in 路径{i.url.RemoveProtection()}}

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
