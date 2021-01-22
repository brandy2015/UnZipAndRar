//
//  XYZPathKit_XYZFIle_Ex.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/7/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 

func 读取demo壁纸照片(图片名称:String = "1",withExtension:String = "JPG") -> UIImage {
    return UIImage(url: Bundle.main.url(forResource: 图片名称, withExtension: withExtension)!) ?? UIImage(url: Bundle.main.url(forResource: "Demo", withExtension: "JPG")!)!
}

public extension UIImage{
    func 保存照片到路径(){
        let data = self.pngData()
        let imageURL = userWallPaper + "nowPaper.jpg"
        if imageURL.exists{ do {try imageURL.deleteFile()}catch{print("删除失败")}}
        do{ try data?.write(to: imageURL, options: [.atomic])}catch{print("写入失败")}
    }
    
    static func 从路径读取壁纸照片() -> UIImage? {
        let imageURL = userWallPaper + "nowPaper.jpg"
        if let 图片 = UIImage(contentsOfFile: imageURL.url.path){
            return 图片
        }else if let DemoJPG = Bundle.main.url(forResource: "Demo", withExtension: "JPG"){
            
            return UIImage(url: DemoJPG)
        }else{
            return nil
        }
        
    }
}


