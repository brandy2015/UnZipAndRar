//
//  XYZPath_UIImage.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
import PDFKit
import MobileCoreServices            //picker.mediaTypes的类型
import PhotosUI                      //LivePhoto使用的依赖库


public extension String {  var ImageFromName:UIImage?{ return UIImage(named: self)}}


public class XYZImage: NSObject {
    public static func GetthumbnailImageFromPDF(PathX:Path?,sizeX:CGSize,atPage:Int = 0) -> UIImage? {
        guard let PathX = PathX else {return nil}
        let FileName = PathX.fileName.withoutExtension + ".png"
        let toPath = userCaches + FileName
        if toPath.exists{return UIImage(url: toPath.url)}else{
            guard let x = PDFDocument(url: PathX.url),let imagX = x.page(at: atPage)?.thumbnail(of: sizeX, for: .trimBox),let imageData = imagX.pngData() else {return nil}
            do {
                try imageData.write(to: toPath)
                return UIImage(url: toPath.url)
            }catch{ return  nil}
        }
    }
}



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
        guard Pathx.exists else{print("exists没执行");return}
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
            if isSuccess { print("保存成功")
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


//public extension UIImage {
//    /// 根据视频url和时间点截图
//    static func thumbnailImageForVideo(videoURL: URL, time: TimeInterval) -> UIImage? {
//
//        let asset = AVURLAsset.init(url: videoURL, options: nil)
//        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
//        assetImageGenerator.appliesPreferredTrackTransform = true
//        assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureMode.encodedPixels
//        let thumbnailCGImage: CGImage?
//        let thumbnailImageTime: CFTimeInterval = time
//        var thumbnailImage: UIImage?
//        do {
//            thumbnailCGImage = try assetImageGenerator.copyCGImage(at: CMTimeMake(Int64(thumbnailImageTime),60), actualTime: nil)
//            if let cgImage = thumbnailCGImage {
//                thumbnailImage = UIImage(cgImage: cgImage)
//            }
//
//        } catch {
//
//        }
//
//        return thumbnailImage
//    }
//
//}

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




//http://www.hangge.com/blog/cache/detail_974.html
//方法一，更改图片方向
//1，实现原理

//UIImage 有个属性叫 imageOrientation，它是一个枚举变量。主要作用是控制image的绘制方向，共有以下8种方向
//enum UIImageOrientation : Int {
//    case Up //0：默认方向
//    case Down //1：180°旋转
//    case Left //2：逆时针旋转90°
//    case Right //3：顺时针旋转90°
//    case UpMirrored //4：水平翻转
//    case DownMirrored //5：水平翻转
//    case LeftMirrored //6：垂直翻转
//    case RightMirrored //7：垂直翻转
//}



//https://en.wikipedia.org/wiki/Exif
//Jpeg图片旋转和Exif方向
//https://blog.csdn.net/fxss5201/article/details/82533551


//2，水平翻转（即左右镜像）//翻转图片的方向
public extension UIImage{
    func flip水平翻转Func() -> UIImage? {
        
        let flipImageOrientation = (self.imageOrientation.rawValue + 4) % 8
        //翻转图片
        return UIImage(cgImage:self.cgImage!,scale:self.scale,orientation:UIImage.Orientation(rawValue: flipImageOrientation)!)
    }
    
    //3，垂直翻转 //翻转图片的方向
    func flip垂直翻转Func() -> UIImage? {
        var flipImageOrientation = (self.imageOrientation.rawValue + 4) % 8
        flipImageOrientation += flipImageOrientation%2==0 ? 1 : -1
        return  UIImage(cgImage:self.cgImage!,scale:self.scale,orientation:UIImage.Orientation(rawValue: flipImageOrientation)!)//翻转图片
    }
}


//方法二，通过Quartz重绘图片，改变原始图片数据
//1，实现原理
//方法1是通过改变 UIImage 的 orientation 实现翻转的，也就是说它只是改变了一个标记而已。
//它内部的图片数据其实还是原始的数据，如果翻转图片不是用来显示，而是需要用于图像识别、图像处理等操作那上面那个方法就不适合了。
//本方法是将 UIImage 的图片原始数据数组进行重排，从而实现翻转。其实现的关键点是在Core Graphics(Quartz)层面上重绘图片。
//2，水平翻转（即左右镜像）
//由于Core Graphics(Quartz) 与 UIKit 的y轴坐标系是相反的，先绕原点旋转180度，再平移一下就好了
//func ReNewImage水平翻转(){
//    //原始图片
//    let srcImage = UIImage(named: "hangge.png")!
//
//    //Quartz重绘图片
//    let rect =  CGRectMake(0, 0, srcImage.size.width , srcImage.size.height);//创建矩形框
//    //根据size大小创建一个基于位图的图形上下文
//    UIGraphicsBeginImageContextWithOptions(rect.size, false, 2)
//    let currentContext =  UIGraphicsGetCurrentContext();//获取当前quartz 2d绘图环境
//    CGContextClipToRect(currentContext, rect);//设置当前绘图环境到矩形框
//    CGContextRotateCTM(currentContext, CGFloat(M_PI)); //旋转180度
//    //平移， 这里是平移坐标系，跟平移图形是一个道理
//    CGContextTranslateCTM(currentContext, -rect.size.width, -rect.size.height);
//    CGContextDrawImage(currentContext, rect, srcImage.CGImage);//绘图
//
//    //翻转图片
//    let drawImage =  UIGraphicsGetImageFromCurrentImageContext();//获得图片
//    let flipImage =  UIImage(CGImage:drawImage.CGImage!,
//                             scale:srcImage.scale,
//                             orientation:srcImage.imageOrientation  //图片方向不用改
//    )
//
//    //图片显示
//    imageView.image = flipImage
//}



//3，垂直翻转
//垂直翻转更简单了。由于 Core Graphics(Quartz) 与 UIKit 的y轴坐标系是相反的，UIKit是y轴向下，Quartz是y轴向上。直接绘制就是垂直翻转的。

//func RenewImage垂直翻转()  {
//    //原始图片
//    let srcImage = UIImage(named: "hangge.png")!
//
//    //Quartz重绘图片
//    let rect =  CGRectMake(0, 0, srcImage.size.width , srcImage.size.height);//创建矩形框
//    //根据size大小创建一个基于位图的图形上下文
//    UIGraphicsBeginImageContextWithOptions(rect.size, false, 2)
//    let currentContext =  UIGraphicsGetCurrentContext();//获取当前quartz 2d绘图环境
//    CGContextClipToRect(currentContext, rect);//设置当前绘图环境到矩形框
//    CGContextDrawImage(currentContext, rect, srcImage.CGImage);//绘图
//
//    //翻转图片
//    let drawImage =  UIGraphicsGetImageFromCurrentImageContext();//获得图片
//    let flipImage =  UIImage(CGImage:drawImage.CGImage!,
//                             scale:srcImage.scale,
//                             orientation:srcImage.imageOrientation  //图片方向不用改
//    )
//
//    //图片显示
//    imageView.image = flipImage
//}


//注：如何防止由于图片重绘造成显示模糊
//由于使用视网膜屏，我的原始图片是 hangge@2x.png。如果使用第二方法，即通过重绘来实现图片翻转并显示出来。那么在创建图形上下文的时候就需要设置好放大倍数。而不能简单地直接 UIGraphicsBeginImageContext(rect.size) 来创建。
//1
//2
////根据size大小创建一个基于位图的图形上下文
//UIGraphicsBeginImageContextWithOptions(rect.size, false, 2)


//旋转图片


public extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        let 尺寸 = CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height)
        self.draw(in: 尺寸);
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
}
