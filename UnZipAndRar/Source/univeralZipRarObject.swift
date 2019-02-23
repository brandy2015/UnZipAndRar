//
//  univeralZipRarObject.swift
//  TestunRar
//
//  Created by 张子豪 on 2018/8/31.
//  Copyright © 2018年 zhangqian. All rights reserved.
//

import UIKit
import Zip
import FileKit
import SHPathManager
import UnrarKit
import SHTManager

public var XYZZIP = universalZipRarObject()

public class universalZipRarObject: NSObject {
 
    var 解压次数 = 0 //用于修改弹出密码框的主题 是否显示重新输入
    public static var shared = universalZipRarObject()
    public func UnzipOrRAR(filePathX:Path,VC:UIViewController,progressX: @escaping ((_ progress: Double) -> ()))  -> Path {
        
        var 返回路径 = Path()
        if let ziporRAR = isZiporRAR(From: filePathX){
            if ziporRAR{
                返回路径 = Zip高级解压缩(VC: VC, From: filePathX, progressX: { (progressx) in
                    progressX(progressx)
                })
            }else{
                //Rar
                let archive = try? URKArchive(path: filePathX.url.path)
                if (archive?.isPasswordProtected()) ?? false{
                    print("需要密码")
                    //  弹出输入密码框
                    
                    
                    返回路径 = 解压缩RARWithPath(VC: VC, From: filePathX, Password: "", progressX: { (Progress) in
                        progressX(Progress)
                        
                    })
                    
                    
                }else{
                    print("不需要密码")
                    返回路径 = 解压缩RARWithPath(VC: VC, From: filePathX, progressX: { (Progress) in
                        progressX(Progress)
                    })
                    
                }
            }
        }else{print("因为不是zip和rar所以无法解压缩")}
        
        return 返回路径
    }
    
    //如果是zip 那么返回true,如果是RAR，返回false
    public func isZiporRAR(From:Path) -> Bool? {
        if From.pathExtension.uppercased() == "ZIP"{
            return true
        }else if From.pathExtension.uppercased() == "RAR"{
            return false
        }else {return nil}
    }
    
    
    //解压缩RAR
    public func 解压缩RARWithPath(VC:UIViewController,From:Path,To:Path = userAlreadyUnZip,Password:String? = nil,progressX: ((_ progress: Double) -> ())? = nil) -> Path {
        let To = To + (From.fileNameCutEx + XYZTime.NowString)
        
        
        let archive = try? URKArchive(path: From.url.path)
        if (archive?.isPasswordProtected()) ?? false{
            archive?.password = Password
        }
        
        do {
            try archive?.extractFiles(to: To.url.path, overwrite: true, progress: { (Info, Progress) in
                print(Info)
                print(Progress)
                
                if let progressX = progressX{
                    progressX(Double(Progress))
                }
                
            })
            
            
            
            解压次数 = 0 //置空
        }catch{
            try? To.deleteFile()
            print("解压缩失败")
            print(error)
            //弹出选择框，是填入密码，或者取消解压缩
            
            J解压缩密码ZipRAR(From: From, VC: VC)
            
            解压次数 += 1
        }
        
        let textFiles = To.find(searchDepth: 3) { path in
            path.url.path.contains("__MACOSX")
            
        }
        
        print("这里这里\n\n\n")
        print(textFiles)
        
        for i in textFiles{
            try? i.deleteFile()
        }
        
        
        return To
    }
    
    
    /////////////////////////////////处理zip
    
    
    //    Advanced Zip
    public func Zip高级解压缩(VC:UIViewController,From:Path,To:Path = userAlreadyUnZip,密码 :String = "password",progressX: ((_ progress: Double) -> ())? = nil) -> Path  {
        print("查看一下")
        print(From.fileNameCutEx)
        
        
        let To = To + (From.fileNameCutEx + XYZTime.NowString)
        
        print("文件后缀去掉")
        print(To)
        
        
        if !To.exists{try? To.createDirectory()}
        
        do{
            // Unzip
            try Zip.unzipFile(From.url, destination: To.url, overwrite: false, password: 密码, progress: { (progress) -> () in
                print("解压缩进度",progress)
                self.解压次数 = 0
                
                if let progressX = progressX{
                    progressX(progress)
                }
            })
            print("弹出解压成功提示")
            
        }catch{
            
            try? To.deleteFile()
            
            
            J解压缩密码ZipRAR(From: From, VC: VC)
            
            print("zip解压缩失败")
            print(error)
            解压次数 += 1
        }
        
        
        let textFiles = To.find(searchDepth: 3) { path in
            path.url.path.contains("__MACOSX")
            
        }
        
        print("这里这里\n\n\n")
        print(textFiles)
        
        for i in textFiles{
            try? i.deleteFile()
        }
        
        return To
    }
    
    //解锁口令窗口
    public func J解压缩密码ZipRAR(From:Path,VC:UIViewController)  {
        
        //添加解锁口令界面
        let alert = UIAlertController(title: "输入解压缩密码", message: "在下面输入密码", preferredStyle: .alert)
        
        if 解压次数 != 0{
            alert.title = "密码不正确"
            alert.message = "重新输入密码"
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .destructive) { (action:UIAlertAction) -> Void in}
        let jiesuoAction = UIAlertAction(title: "解压缩", style: .default,handler:{ (action:UIAlertAction) -> Void in
            let textField = alert.textFields!.first
            /////////////////////////////////////////////
            if let x = textField?.text {
                
                if let ziporRAR = self.isZiporRAR(From: From){
                    if ziporRAR{
                        //zip
                        _ = self.Zip高级解压缩(VC: VC, From: From, 密码: x)
                    }else{
                        _ = self.解压缩RARWithPath(VC: VC, From: From,Password: x)
                    }
                }else{print("因为不是zip和rar所以无法解压缩")}
                
                
                
                print(x)
            }else{
                print("无密码")
            }
        })
        
        jiesuoAction.isEnabled = false
        alert.addTextField { (textField2:UITextField) -> Void in
            textField2.placeholder = "Password？"

            NotificationCenter.default.addObserver(forName:  UITextField.textDidChangeNotification, object: textField2, queue: OperationQueue.main) { (notification) in
                jiesuoAction.isEnabled  = textField2.text != ""
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(jiesuoAction)
        VC.present(alert, animated: true, completion: nil)
    }
    
    
    //    //压缩成的文件加密码时候有问题！！！！解压缩会失败
    public func ZipFile(From:[URL],To finalURL:URL,progressX: @escaping ((_ progress: Double) -> ())) {
        do{
            try Zip.zipFiles(paths: From, zipFilePath: finalURL, password: nil, progress: { (progress) -> () in
                print(progress)
                progressX(progress)
            }) //Zip
        }catch{print(error)}
    }
}


public func PathArray转URLArray(转:[Path]) -> [URL]? {
    var 返回数组 :[URL]? = nil
    
    for i in 转{
        返回数组?.append(i.url)
    }
    
    return 返回数组
}
