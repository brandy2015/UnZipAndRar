//
//  XYZFileExtension.swift
//  XYZManager
//
//  Created by 张子豪 on 2020/2/24.
//  Copyright © 2020 张子豪. All rights reserved.
//

//import UIKit
 
//
//public func 检测Pic文件并移至Pic文件夹(searchDepth:Int = 1)  {
//    let textFiles = Path.userDocuments.find(searchDepth: searchDepth) { path in  path.isPic}
//
//    for i in textFiles{
//        if i^ != userPic{
//            do {
//                try i ->> (userPic + i.fileName)
//            }catch{print("再次尝试移动")
//                do {
//                    let newFileName = UUID().uuidString + "." + i.pathExtension
//                    let newFilePath = userPic + newFileName
//                    try i ->> newFilePath
//                }catch{print("移动失败")}
//            }
//        }else{ /* print(i.fileName + "在Music中")*/}
//    }
//}



//准备删除

//
//public extension Path{
//    func containExtension(FilePath:Path,FileExs:[String]) -> Bool {
//        return FileExs.contains(FilePath.pathExtension.uppercased())
//    }
//
//    var isMusic:Bool{
//        return containExtension(FilePath: self, FileExs: ["MP3","FLAC","M4A","WAV","M4R"])
//    }
//
//    var isVideo:Bool{
//        return containExtension(FilePath: self, FileExs: ["MOV","MP4","AVI","WMV","MPG","M4V","MPG","RMVB","MKV","FLV","3GP"])
//    }
//
//    var isPic:Bool{
//        //        print("图片has值")
//        //
//        //        print(FilePath.hashValue)
//        //
//        //        print("FileType")
//        //        print(FilePath)
//
//        return containExtension(FilePath: self, FileExs: ["PNG","JPG","JPEG","HEIC"])
//    }
//
//    var isPDF:Bool{
//        return containExtension(FilePath: self, FileExs: ["PDF"])
//    }
//    var isZip:Bool{
//        return containExtension(FilePath: self, FileExs: ["ZIP","RAR"])
//    }
//    var isLMR:Bool{
//        return containExtension(FilePath: self, FileExs: ["LMR"])
//    }
//
    
//    var XYZFileType:XYZFileTypeEnum{
//        if self.isDirectory { return .Directory}
//        if isMusic{return .Music}
//        if isVideo{return .Video}
//        if isPic{return .Photo}
//        if isPDF{return .PDF}
//        if isZip{return .Compression}
//        if isLMR{return .LMR}
//        return .unknowntype
//    }
//    
//    
//    func ReturnMusicTextPath(searchDepth:Int = 1) -> [Path] {
//        return self.find(searchDepth: searchDepth) { path in  path.isMusic}
//    }
//    func ReturnVideoTextPath(searchDepth:Int = 1) -> [Path] {
//        return self.find(searchDepth: searchDepth) { path in  path.isVideo}
//    }
//    func ReturnPicTextPath(searchDepth:Int = 1) -> [Path] {
//        return self.find(searchDepth: searchDepth) { path in  path.isPic}
//    }
//    func ReturnPDFTextPath(searchDepth:Int = 1) -> [Path] {
//        return self.find(searchDepth: searchDepth) { path in  path.isPDF}
//    }
//    func ReturnZipTextPath(searchDepth:Int = 1) -> [Path] {
//        return self.find(searchDepth: searchDepth) { path in  path.isZip}
//    }
//    func ReturnLMRTextPath(searchDepth:Int = 1) -> [Path] {
//        return self.find(searchDepth: searchDepth) { path in  path.isLMR}
//    }
//}
//



//extension MusicRealmObjectMusicRealmObject {
//
//    func changeName(FileFolder:Path,newName:String,realm: Realm? = try? Realm()){ guard let realm = realm else { return }
//        try? self.Pathx ->> (FileFolder + newName)
//        try? realm.write {
//            self.FileName = newName
//        }
//    }
//    //需要国际化
//    func RenameBTN(FileFolder:Path,VC:UIViewController) {
//        //添加解锁口令界面
//        let alert = UIAlertController(title: "重命名".localized(), message: "输入新名字", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "不修改".localized(), style: .default, handler: nil)
//        let jiesuoAction = UIAlertAction(title: "修改", style: .default) { (action) in
//            let textField = alert.textFields!.first
//            let 新名字 = textField?.text ?? self.FileName.withoutExtension
//            let 新名字加后缀 = 新名字 + "." + self.pathExtension
//            self.changeName(FileFolder: userMusic, newName: 新名字加后缀)
//        }
//
//        jiesuoAction.isEnabled = false
//        alert.addTextField { (textField2:UITextField) -> Void in
//            textField2.text = self.FileName.withoutExtension
//            textField2.placeholder = self.FileName.withoutExtension
//
//            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField2, queue: OperationQueue.main) { (notification) in
//                jiesuoAction.isEnabled  = textField2.text != ""
//            }
//
//        }
//        alert.addAction(cancelAction)
//        alert.addAction(jiesuoAction)
//        VC.present(alert, animated: true, completion: nil)
//    }
//}
