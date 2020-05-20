//
//  XYZPathKit_IsWhichType.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 

public func Musiccontain判断函数Music(FilePath:Path) -> Bool {
    let fileExtension = FilePath.pathExtension.uppercased()
    let FileExtension = ["MP3","FLAC","M4A","WAV","M4R","OGG","RAM"]
    return FileExtension.contains(fileExtension)
}




public func PicContain判断函数(FilePath:Path) -> Bool {
    let fileExtension = FilePath.pathExtension.uppercased()
    let FileExtension = ["PNG","JPG","JPEG","HEIC","GIF","BMP"]
    return FileExtension.contains(fileExtension)
}

public func Videocontain判断函数(FilePath:Path) -> Bool {
    let fileExtension = FilePath.pathExtension.uppercased()
    let VideoExtension = ["MOV","MP4","AVI","WMV","MPG","M4V","MPG","RMVB","MKV","FLV","3GP","MPG","RMVB","MKV","FLV","WMA","VOB","DIVX"]
    return VideoExtension.contains(fileExtension)
}


public func PDFContain判断函数(FilePath:Path) -> Bool {
    let fileExtension = FilePath.pathExtension.uppercased()
    let FileExtension = ["PDF"]
    return FileExtension.contains(fileExtension)
}


public func zipContain判断函数(FilePath:Path) -> Bool {
    let fileExtension = FilePath.pathExtension.uppercased()
    let FileExtension = ["ZIP","RAR"]
    return FileExtension.contains(fileExtension)
}
public func LMRContain判断函数(FilePath:Path) -> Bool {
    let fileExtension = FilePath.pathExtension.uppercased()
    let FileExtension = ["LMR"]
    return FileExtension.contains(fileExtension)
}
