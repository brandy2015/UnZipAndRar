//
//  XYZUIImage.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/3/13.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import MobileCoreServices            //picker.mediaTypes的类型
import PhotosUI                      //LivePhoto使用的依赖库
import UIKit
import FileKit
import MediaPlayer
import SHTManager


open class XYZUIImage: XYZFile {

    public var size: CGSize?
    public var xyzImage:UIImage?
    
    public init(Name:String,Type:String) {
        let Pathx = FileInMainBundlePath(Name: Name, Type: Type)
        super.init(Pathx: Pathx ?? Path())
        
        if let Pathx = Pathx{
            self.xyzImage = try? UIImage(contentsOfPath: Pathx)
            self.size = self.xyzImage?.size
        }
        
        
    }
    
    public override init(Pathx: Path) {
        super.init(Pathx: Pathx)
        
        guard Pathx.exists else{
            print("exists没执行")
            return
            
        }
        self.xyzImage = try? UIImage(contentsOfPath: Pathx)
        self.size = self.xyzImage?.size
        
        
    }
    
    
}



public extension UIImage{

    
    func SaveToAlbum(completion: @escaping (_ isSuccess: Bool, _ error: Error?) -> Void)  {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: self)
        }) { (isSuccess: Bool, error: Error?) in
            completion(isSuccess,error)
            
            if isSuccess {
                print("保存成功")
            } else{ print("保存失败：", error!.localizedDescription)}
        }
    }
}


public extension URL{
    func savePicOrGIFToAlbum(completion: @escaping (_ isSuccess: Bool, _ error: Error?) -> Void)  {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: self)
        }) { (isSuccess: Bool, error: Error?) in
            completion(isSuccess,error)
            
            if isSuccess {
                print("保存成功")
            } else{ print("保存失败：", error!.localizedDescription)}
        }
    }
}


/*
 
 class XYZImage: NSObject {
 
 static var shared = XYZImage()
 
 var XYZURL : URL? = nil
 
 var Longitude:String? = nil
 var Latitude:String? = nil
 var LatitudeRef:String? = nil
 var Altitude:String? = nil
 var LongitudeRef:String? = nil
 
 var creationDate:Date? = nil
 
 var LensModel:String? = nil
 var LensMake:String? = nil
 var size:(Double,Double)? = nil
 //        let xps = XYZImage.shared.返回GPSDictionary(URLX: pathX.url)
 //        print(xps)
 func 返回GPSDictionary(URLX:URL) -> [String:AnyObject]? {
 self.XYZURL = URLX
 if let img = CIImage(contentsOf: URLX){
 
 
 let metadata = img.properties
 
 if let gpsData = metadata[kCGImagePropertyGPSDictionary as String] as? [String:AnyObject]{
 self.Latitude = gpsData["Latitude"] as? String
 self.Longitude = gpsData["Longitude"]  as? String
 self.LatitudeRef = gpsData["LatitudeRef"] as? String
 self.LongitudeRef = gpsData["LongitudeRef"]  as? String
 self.Altitude = gpsData["Altitude"]  as? String
 return gpsData
 }else{
 return nil
 }
 
 
 
 }
 return nil
 }
 
 
 //    let xxxx = XYZImage.shared.返回相片具体数据(URLX: url)
 //    print(xxxx)
 func 返回相片具体数据(URLX:URL) -> AnyObject?{
 let imageSource = CGImageSourceCreateWithURL(URLX as CFURL, nil)!
 let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary?
 if let exifDict = imageProperties?[kCGImagePropertyExifDictionary]{
 
 
 if let x = exifDict as? Dictionary<String,AnyObject>{
 if let datex = x["DateTimeDigitized"] as? String{
 //                    print("l🐵🐵🐵🐵🐵🐵🐵🐵")
 self.creationDate = datex.ToXYZDate(format: "YYYY:MM:dd HH:mm:ss")
 
 //                        String.ToDate(dateString: datex, format: "YYYY:MM:dd HH:mm:ss")
 
 }
 if let LensModelx = x["LensModel"] as? String{
 //                                        print("l🐵🐵🐵🐵🐵🐵🐵🐵")
 self.LensModel = LensModelx
 //                    print(LensModelx)
 }
 if let LensMakex = x["LensMake"] as? String{
 //                    print("l🐵🐵🐵🐵🐵🐵🐵🐵")
 self.LensMake = LensMakex
 //                    print(LensMakex)
 }
 
 
 }
 
 
 return exifDict
 
 }else{
 return nil
 }
 
 
 
 }
 
 
 func 返回UIImage的一些属性(URLX:URL)  {
 
 
 //        print(imagex?.size)
 //        print(imagex?.imageOrientation.rawValue)
 }
 
 
 }

 
 */
