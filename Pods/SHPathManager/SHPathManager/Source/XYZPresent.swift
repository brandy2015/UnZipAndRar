//
//  XYZPresent.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/2/16.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

class XYZPresent: NSObject {

}

public func PresentShareView(VC:UIViewController,URLs:[URL],on View:UIView){
    let activityController = XYZShareActivityVC(URLs: URLs, on: View)
    VC.present(activityController, animated: true, completion: nil)
}

public extension UIViewController{
      func PresentShareView(URLs:[URL]){
        let activityController = XYZShareActivityVC(URLs: URLs, on: self.view)
        self.present(activityController, animated: true, completion: nil)
    }
}

public func XYZShareActivityVC(URLs:[URL],on View:UIView) -> UIActivityViewController{
    //    let fileURL = 文件地址
    let activityController = UIActivityViewController(activityItems: URLs, applicationActivities: nil)
    let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.message, UIActivity.ActivityType.mail, UIActivity.ActivityType.print, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToTencentWeibo]
    activityController.excludedActivityTypes = excludedActivities
    activityController.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
    activityController.popoverPresentationController?.sourceView = View
    
    return activityController
}
