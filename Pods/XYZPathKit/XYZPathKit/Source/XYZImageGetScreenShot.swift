
//
//  XYZImageGetScreenShot.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/12/17.
//  Copyright © 2019 zhangqian. All rights reserved.
//

import UIKit
 
import Photos
import AVFoundation

 

public extension URL{
    enum XYZTestError: Error{
        case ErrorOne (String)
        case ErrorTwo (String)
        case ErrorThree (String)
        case ErrorOther (String)
    }
    
    //根据参数number抛出不同的错误
    func throwErrorFun(number: Int) throws {
        if number == 0 {
            print("OK")
        } else if number == 1 {
            throw XYZTestError.ErrorOne("错误1")
        } else if number == 2 {
            throw XYZTestError.ErrorTwo("错误2")
        } else if number == 3 {
            throw XYZTestError.ErrorThree("错误3")
        } else {
            throw XYZTestError.ErrorOther("其他")
        }
    }
    func getImageDataFromVideo() throws -> Data? {
        guard let CGImageX = self.生成截图(URL路径: self) ,let 截图data = UIImage(cgImage: CGImageX).pngData() else{
            print("没有截图Datatatatat")
            throw XYZTestError.ErrorOne("截图转换成png Data失败")
        }
        
        return 截图data
    }
    func getImageAlldatatype() throws -> (UIImage?,Data?,URL?) {
        guard let CGImageX = self.生成截图(URL路径: self) else{
            throw XYZTestError.ErrorOne("生成截图失败")
        }
        guard let 截图data = UIImage(cgImage: CGImageX).pngData() else{
            print("没有截图Datatatatat")
            throw XYZTestError.ErrorOne("截图转换成png Data失败")
        }
        

        let assetIdentifier = UUID().uuidString
        let photoPathURL = (userTemp + "\(assetIdentifier).jpg").url
        
        do {
            try 截图data.write(to:photoPathURL, options: [.atomic])
        }catch{print("转写data截图失败")}
        
        
        return (UIImage(cgImage: CGImageX),截图data,photoPathURL)
    }
    
    
//    func getImageData() throws -> Data? {
//        guard let CGImageX = self.生成截图(URL路径: self) else{
//            throw TestError.ErrorOne("生成截图失败")
//        }
//        guard let 截图data = UIImage(cgImage: CGImageX).pngData() else{
//            print("没有截图Datatatatat")
//            throw TestError.ErrorOne("截图转换成png Data失败")
//        }
//        return 截图data
//    }
    //这里写成闭包返回
    func 生成截图(URL路径:URL) -> CGImage? {
        let generator = AVAssetImageGenerator(asset: AVAsset(url: URL路径))
        generator.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(0.0,preferredTimescale: 600)
        var actualTime:CMTime = CMTimeMake(value: 0,timescale: 0)

        do {let imageRef:CGImage = try generator.copyCGImage(at: time, actualTime: &actualTime)
            return imageRef
        }catch{print(error)
            return nil
        }
    }
    
    
}
