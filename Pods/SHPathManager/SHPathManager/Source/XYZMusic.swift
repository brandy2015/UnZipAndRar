//
//  XYZMusic.swift
//  SHPathManager
//
//  Created by 张子豪 on 2019/2/17.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import FileKit
import UIKit
import FileKit
import MediaPlayer
import AVFoundation
import SHTManager

open class XYZMusic: XYZFile {
    public var mp3Asset : AVURLAsset? = nil
    //    (url: Pathx.url, options: nil)
    public var artist    :String?           = nil           //歌手
    public var songName  :String?           = nil           //歌曲名
    public var MusicImageX:UIImage?         = nil           //图片
    public var albumName :String?           = nil           //专辑名
    
    //专辑封面
    let mySize               = CGSize(width: 400, height: 400)
    public var albumArt : MPMediaItemArtwork? = nil
    
    
    public var 播放长度      :Double = 0.0
    
    public init(Pathx: Path,MusicImage:UIImage? = nil) {
        super.init(Pathx: Pathx)
        
        guard Pathx.exists else{return}
        
        
        if let MusicImage = MusicImage{
            self.MusicImageX = MusicImage
        }
        self.mp3Asset = AVURLAsset(url: Pathx.url)
        
        
        guard let formats = mp3Asset?.availableMetadataFormats else {
            return
        }
        var MetaX: [String? : Any?] = [:]
        for format in formats{
            
            guard let metaData = mp3Asset?.metadata(forFormat: format) else{
                return
            }
            MetaX = AVMetadataItem.ToInfoDic(metaData: metaData)
        }
        self.songName  = MetaX["title"]     as? String//歌曲名
        self.artist    = MetaX["artist"]    as? String//作曲家名
        self.albumName = MetaX["albumName"] as? String//专辑名
        
        
        let artworkData  = MetaX["artwork"]   as? Data
        if let artworkData = artworkData ,let ImageXX = UIImage(data: artworkData){
            self.MusicImageX = ImageXX                //artwork专辑照片
        }
        
        //为Flac准备
        if self.songName == nil{
            self.songName = self.NameCutEx
        }
        if self.artist == nil {
            self.artist = "未知"
        }
        if self.albumName == nil {
            self.albumName = "未知"
        }
        
        self.albumArt = MPMediaItemArtwork(image: self.MusicImageX ?? UIImage())
    }
    
    
}
