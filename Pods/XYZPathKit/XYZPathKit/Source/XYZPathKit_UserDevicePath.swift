//
//  XYZPathKit_UserDevicePath.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//
 
import UIKit

//获取系统的路径
public let userDocument     = Path.userDocuments
public let userCaches       = Path.userCaches
public let userLibrary      = Path.userLibrary
public let userDocChildens  = Path.userDocuments.children()
public let userInbox        = Path.userDocuments   + "Inbox"
public let userTemp         = Path.userTemporary



//自己生成的路径
public var userMusic:Path{ let userFolderX  = Path.userDocuments   + "Music"     ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userFile :Path{ let userFolderX  = Path.userDocuments   + "File"      ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userVideo:Path{ let userFolderX  = Path.userDocuments   + "Video"     ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userPDF  :Path{ let userFolderX  = Path.userDocuments   + "PDF"       ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userLMR  :Path{ let userFolderX  = Path.userDocuments   + "LMR"       ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userZip  :Path{ let userFolderX  = Path.userDocuments   + "Zip"       ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userPic  :Path{ let userFolderX  = Path.userDocuments   + "Picture"   ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }


public var userInbox1       :Path{
    let userFolderX  = Path.userDocuments   + "Inbox1"        ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userCookies      :Path{
    let userFolderX  = Path.userDocuments   + "Cookies"       ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userPreferences  :Path{
    let userFolderX  = Path.userDocuments   + "Preferences"   ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userAlreadyUnZip :Path{
    let userFolderX  = Path.userDocuments   + "alreadyUnZip"  ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userSecretFileFolder  :Path{
    let userFolderX  = Path.userDocuments   + "SecretFileFolder" ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var AppSupport       :Path{
    let userFolderX  = Path.userDocuments   + "Application Support"   ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userWallPaper    :Path{
    let userFolderX  = Path.userDocuments   + "WallPaper"      ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userRealmDataBase:Path{
    let userFolderX  = Path.userDocuments   + "RealmDataBase"  ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
public var userRealmFolder  :Path{
    let userFolderX  = Path.userDocuments   + "RealmFolder"    ;if !userFolderX.exists{try? userFolderX.createDirectory()  } ; return userFolderX }
