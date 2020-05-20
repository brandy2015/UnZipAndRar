//
//  ViewController.swift
//  UnZipAndRar
//
//  Created by 张子豪 on 2018/10/17.
//  Copyright © 2018 张子豪. All rights reserved.
//

import UIKit
//import FileKit
import XYZPathKit

class unzipVC: UIViewController {


    @IBAction func 压缩BTN(_ sender: Any) {
        let jpgX = userDocument + "1.JPG"
        let movX = userDocument + "2.mov"
        let zipfileName = UUID().uuidString + ".zip"
        let zipX = userDocument + zipfileName
        XYZZIP.ZipFile(From: [jpgX.url,movX.url], To: zipX.url) { (ProgressX) in
            print("进度在这里")
            print(ProgressX)
            if ProgressX == 1.0{
                print("压缩结束")
            }
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

