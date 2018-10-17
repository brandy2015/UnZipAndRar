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
import SSZipArchive
import UnrarKit
import SHTManager

var CurrentZipRar = universalZipRarObject()

class universalZipRarObject: NSObject {

    
    var 解压次数 = 0 //用于修改弹出密码框的主题 是否显示重新输入
    
    func UnzipOrRAR(filePathX:Path,VC:UIViewController)  {
        self.VC = VC
        
        if let ziporRAR = isZiporRAR(From: filePathX){
            if ziporRAR{
                //zip
                Zip高级解压缩(From: filePathX)
            }else{
                //Rar
                let archive = try? URKArchive(path: filePathX.url.path)
                if (archive?.isPasswordProtected()) ?? false{
                    print("需要密码")
                //  弹出输入密码框
                    
                    decompressRAR(From: filePathX, Password: "")
                }else{
                    print("不需要密码")
                    decompressRAR(From: filePathX)
                }
            }
        }else{print("因为不是zip和rar所以无法解压缩")}
    }
    
    
    
    
    //如果是zip 那么返回true,如果是RAR，返回false
    func isZiporRAR(From:Path) -> Bool? {
        
        if From.pathExtension == "zip" || From.pathExtension == "Zip" || From.pathExtension == "ZIP"{
            return true
        }else if From.pathExtension == "rar" || From.pathExtension == "Rar" || From.pathExtension == "RAR"{
            return false
        }else {
            return nil
        }
        
    }
    
    
    //解压缩RAR
    func decompressRAR(From:Path,To:Path = userDocument + "ZipOrRar",Password:String? = nil)  {
        
        
        let archive = try? URKArchive(path: From.url.path)
        if (archive?.isPasswordProtected()) ?? false{
            archive?.password = Password
        }
        
        
        var 解压缩到路径 = To + removeExtension(路径: From.fileName)
        print(解压缩到路径)
        if !To.exists{try? To.createDirectory()}
        
        
        print(解压缩到路径)
        if 解压缩到路径.exists{
            
            
            
            let m = (removeExtension(路径: From.fileName) + "\(Date.ToInt(date: SHTManager.Now))")
            解压缩到路径 = To + m
            if !解压缩到路径.exists{
                
                do {try 解压缩到路径.createDirectory()}catch{
                    print(error)
                }
            }
        }
        
        do {
            try archive?.extractFiles(to: 解压缩到路径.url.path, overwrite: true, progress: nil)
            
            解压次数 = 0 //置空
        }catch{
            try? 解压缩到路径.deleteFile()
            print("解压缩失败")
            print(error)
            //弹出选择框，是填入密码，或者取消解压缩
            
            J解压缩密码ZipRAR(From: From)
           
            解压次数 += 1
        }
        
    }
    
    
    /////////////////////////////////处理zip

    
    //    Advanced Zip
    func Zip高级解压缩(From:Path,To:Path = userDocument + "ZipOrRar",密码 :String = "password")  {
        if !To.exists{try? To.createDirectory()}
        var 解压缩到路径 = To + removeExtension(路径: From.fileName)
        print(解压缩到路径)
        if !To.exists{try? To.createDirectory()}
        print(解压缩到路径)
        if 解压缩到路径.exists{
            let m = (removeExtension(路径: From.fileName) + "\(Date.ToInt(date: SHTManager.Now))")
            解压缩到路径 = To + m
            if !解压缩到路径.exists{
                do {try 解压缩到路径.createDirectory()}catch{
                    print(error)
                }
            }
        }
        
        do{
            // Unzip
            try Zip.unzipFile(From.url, destination: 解压缩到路径.url, overwrite: false, password: 密码, progress: { (progress) -> () in
                print("解压缩进度",progress)
                self.解压次数 = 0
                
            })
            print("弹出解压成功提示")
            
        }catch{
            
            try? 解压缩到路径.deleteFile()
            
            
            J解压缩密码ZipRAR(From: From)
            
            print("zip解压缩失败")
            print(error)
            解压次数 += 1
        }
        
    }
    var VC = UIViewController()
    //解锁口令窗口
    func J解压缩密码ZipRAR(From:Path){//,VC:UIViewController)  {
       
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
                       self.Zip高级解压缩(From: From, 密码: x)
                    }else{
                        self.decompressRAR(From: From,Password: x)
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
        
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField2, queue: OperationQueue.main) { (notification) in
                jiesuoAction.isEnabled  = textField2.text != ""
            }
            
            
            //            NotificationCeUITextField.textDidChangeNotification(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField2, queue: OperationQueue.main) { (notification) in
//                jiesuoAction.isEnabled  = textField2.text != ""
//            }
        }
        alert.addAction(cancelAction)
        alert.addAction(jiesuoAction)
        VC.present(alert, animated: true, completion: nil)
    }
    
    
//    //压缩成的文件有问题！！！！
//    func 高级压缩(From:[Path],To:Path) {
//
//        let zipFilePath = To.url                 //"archive.zip"需要写清楚文件名还有后缀
//
//        if let 路径 =  PathArray转URLArray(转: From){
//            do{
//
//                try Zip.zipFiles(paths: 路径, zipFilePath: zipFilePath, password: "password", progress: { (progress) -> () in
//                    print(progress)
//                }) //Zip
//
//
//            }catch{
//                print(error)
//            }
//
//        }else{
//            print("没有文件")
//        }
//    }
    
}


func PathArray转URLArray(转:[Path]) -> [URL]? {
    var 返回数组 :[URL]? = nil
    
    for i in 转{
        返回数组?.append(i.url)
    }
    
    return 返回数组
}


func removeExtension(路径:String) -> String {
    var 返回路径 = 路径
    if 返回路径.contains("."){
        for _ in 0...3{
            返回路径.removeLast()
        }
    }
    
    return 返回路径
}


