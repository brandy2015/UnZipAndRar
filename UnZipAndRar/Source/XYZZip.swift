//
//  XYZZip.swift
//  UnZipAndRar
//
//  Created by 张子豪 on 2019/12/16.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZZip: NSObject {

}
//
////  XYZZip_Extension.swift
////  VTLMaker
////
////  Created by 张子豪 on 2019/11/10.
////  Copyright © 2019 zhangqian. All rights reserved.
////
//
//import UIKit
//import Photos
//import PhotosUI
//import MobileCoreServices
//import AVFoundation
//import FileKit
//import Zip
//import SHPathManager
//import SHTManager
//
//func 压缩(filePath路径组:[URL],压缩文件文件名:String = "archive")  {
//    do { let zipFilePath = try Zip.quickZipFiles(filePath路径组, fileName: 压缩文件文件名) // Zip
//        print("返回的压缩后的路径")
//        print(zipFilePath)
//    }catch {print("压缩失败")}
//}
//var 解压计数器 = 0
//func 解压缩(filePath路径组:[URL]) -> [URL] {
//    解压计数器 += 1
//    var 解压完成路径URL集合 = [URL]()
//    for filePath in filePath路径组{
//        do {let unzipDirectory1 = try Zip.quickUnzipFile(filePath); /* Unzip  */print(unzipDirectory1)
//            解压完成路径URL集合.append(unzipDirectory1); print("解压了\(解压计数器)次")
//        }catch { print("解压缩失败")}
//    }
//    print("返回解压缩路径")
//    print(解压完成路径URL集合)
//    return 解压完成路径URL集合
//}
//
//func 高级压缩(需要压缩的文件路径url:[URL],文件名:String = "archive",压缩成的类型:String = "lmr",密码:String = "1",压缩终点:URL)  {
//    let 压缩终点 = userTemp.url.appendingPathComponent("\(文件名).\(压缩成的类型)")
//    do { try Zip.zipFiles(paths: 需要压缩的文件路径url, zipFilePath: 压缩终点, password: 密码, progress: { (progress) -> () in
//        print(progress); if progress == 1.0{ print("压缩完成")} }) //Zip
//    }catch { print("压缩失败")
//        print(error)
//    }
//}
//
//
//
//
//
//func 高级解压缩(filePath需要解压URL路径:URL,密码:String = "1",解压终点:URL)  {
//    let 解压终点 = userTemp.url //解压终点是/user/document
//    do { try Zip.unzipFile(filePath需要解压URL路径, destination: 解压终点, overwrite: true, password: 密码, progress: { (progress) -> () in print(progress);if progress == 1.0{print("压缩完成")}}) // Unzip
//    }catch { print("解压失败")}
//}
