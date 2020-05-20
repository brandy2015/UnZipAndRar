//
//  XYZPathKit_URL_Extension.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 
import MobileCoreServices
import AVFoundation

public func fileToURL(_ file: String) -> URL? {
    // Get the full path of the file
    let fileComponents = file.components(separatedBy: ".")
    guard let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) else{return nil}
    return URL(fileURLWithPath: filePath)
}
extension String{var ToURL :URL{return URL(fileURLWithPath: self)}}

public func PathsToURLs(Paths:[Path]) -> [URL] {
    var BackURLs = [URL]()
    for i in Paths{ BackURLs.append(i.url)}
    return BackURLs
}

public extension URL{
    enum TestError: Error{
        case ErrorOne (String)
        case ErrorTwo (String)
        case ErrorThree (String)
        case ErrorOther (String)
    }
    
    var ScreenShotUIImage:UIImage? {
        return self.getScreenShot()
    }
    
    var ScreenShotData:Data? {
        return self.getScreenShot()?.pngData()
    }
    
    func getImageAlldatatype() throws -> URL? {
        let assetIdentifier = UUID().uuidString
        let photoPathURL = (userTemp + "\(assetIdentifier).jpg").url
        do {
            try ScreenShotData?.write(to:photoPathURL, options: [.atomic])
            return photoPathURL
        }catch{print("转写data截图失败");return nil}
    }
    
    
    //这里写成闭包返回
    private func getScreenShot() -> UIImage? {
        let generator = AVAssetImageGenerator(asset: AVAsset(url: self))
        generator.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(0.0,preferredTimescale: 600)
        var actualTime:CMTime = CMTimeMake(value: 0,timescale: 0)
        
        do {let imageRef:CGImage = try generator.copyCGImage(at: time, actualTime: &actualTime)
            return UIImage(cgImage: imageRef)
        }catch{print(error)
            return nil
        }
    }
    
    
}
