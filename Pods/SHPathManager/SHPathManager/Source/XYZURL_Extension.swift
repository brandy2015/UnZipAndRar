//
//  XYZURL_Extension.swift
//  VTLMaker
//
//  Created by 张子豪 on 2019/11/10.
//  Copyright © 2019 zhangqian. All rights reserved.
//

import UIKit

import SHTManager
import FileKit
import MobileCoreServices
import AVFoundation
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
