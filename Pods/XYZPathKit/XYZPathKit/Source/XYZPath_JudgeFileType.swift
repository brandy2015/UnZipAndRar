//
//  XYZPath_JudgeFileType.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/22.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit


public extension Path{
    func containExtension(FilePath:Path,FileExs:[String]) -> Bool {
        return FileExs.contains(FilePath.pathExtension.uppercased())
    }
    
    var isMusic:Bool{
        return containExtension(FilePath: self, FileExs: ["MP3","FLAC","M4A","WAV","M4R"])
    }
    
    var isVideo:Bool{
        return containExtension(FilePath: self, FileExs: ["MOV","MP4","AVI","WMV","MPG","M4V","MPG","RMVB","MKV","FLV","3GP"])
    }
    
    var isPic:Bool{
        //        print("图片has值")
        //
        //        print(FilePath.hashValue)
        //
        //        print("FileType")
        //        print(FilePath)
        
        return containExtension(FilePath: self, FileExs: ["PNG","JPG","JPEG","HEIC"])
    }
    
    var isPDF:Bool{
        return containExtension(FilePath: self, FileExs: ["PDF"])
    }
    var isZip:Bool{
        return containExtension(FilePath: self, FileExs: ["ZIP","RAR"])
    }
    var isLMR:Bool{
        return containExtension(FilePath: self, FileExs: ["LMR"])
    }
    
    
    var XYZFileType:XYZFileTypeEnum{
        if self.isDirectory { return .Directory}
        if isMusic{return .Music}
        if isVideo{return .Video}
        if isPic{return .Photo}
        if isPDF{return .PDF}
        if isZip{return .Compression}
        if isLMR{return .LMR}
        return .unknowntype
    }
    
    
    func ReturnMusicTextPath(searchDepth:Int = 1) -> [Path] {
        return self.find(searchDepth: searchDepth) { path in  path.isMusic}
    }
    func ReturnVideoTextPath(searchDepth:Int = 1) -> [Path] {
        return self.find(searchDepth: searchDepth) { path in  path.isVideo}
    }
    func ReturnPicTextPath(searchDepth:Int = 1) -> [Path] {
        return self.find(searchDepth: searchDepth) { path in  path.isPic}
    }
    func ReturnPDFTextPath(searchDepth:Int = 1) -> [Path] {
        return self.find(searchDepth: searchDepth) { path in  path.isPDF}
    }
    func ReturnZipTextPath(searchDepth:Int = 1) -> [Path] {
        return self.find(searchDepth: searchDepth) { path in  path.isZip}
    }
    func ReturnLMRTextPath(searchDepth:Int = 1) -> [Path] {
        return self.find(searchDepth: searchDepth) { path in  path.isLMR}
    }
}

