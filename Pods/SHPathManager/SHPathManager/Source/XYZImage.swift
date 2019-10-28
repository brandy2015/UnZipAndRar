//
//  XYZImage.swift
//  SoHow
//
//  Created by 张子豪 on 2019/8/6.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import PDFKit
import FileKit
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
