//
//  XYZPath_XYZMusic.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
 
import MediaPlayer
import AVFoundation

open class XYZMusic: XYZFile {
    public var mp3Asset : AVURLAsset? = nil
    //    (url: Pathx.url, options: nil)
    public var artist    :String?           = nil           //歌手
    public var songName  :String?           = nil           //歌曲名
    public var MusicImageX:UIImage?         = nil           //图片
    public var albumName :String?           = nil           //专辑名
    
    //专辑封面
    let mySize = CGSize(width: 400, height: 400)
    public var albumArt : MPMediaItemArtwork? = nil
    
    
    public var 播放长度      :Double = 0.0
    
    public init(Pathx: Path,MusicImage:UIImage? = nil) {
        super.init(Pathx: Pathx)
        guard Pathx.exists else{return}
        self.MusicImageX = MusicImage
        self.mp3Asset = AVURLAsset(url: Pathx.url)
        
        guard let formats = mp3Asset?.availableMetadataFormats else {return}
        
        var MetaX: [String? : Any?] = [:]
        for format in formats {
            guard let metaData = mp3Asset?.metadata(forFormat: format) ,let metacc = AVMetadataItem.ToInfoDic(metaData: metaData) else{print("metaData没执行");return}
            MetaX =  metacc
        }
        self.songName  = MetaX["title"]     as? String//歌曲名
        self.artist    = MetaX["artist"]    as? String//作曲家名
        self.albumName = MetaX["albumName"] as? String//专辑名
        let artworkData  = MetaX["artwork"]   as? Data
        if let artworkData = artworkData ,let ImageXX = UIImage(data: artworkData){ self.MusicImageX = ImageXX   }             //artwork专辑照片
        
        
        //为Flac准备
        if self.songName == nil{self.songName = self.NameCutEx}
        if self.artist == nil {self.artist = "未知"}
        if self.albumName == nil {self.albumName = "未知"}
        self.albumArt = MPMediaItemArtwork(boundsSize: mySize) { (size) -> UIImage in
            return self.MusicImageX ?? UIImage()
        }
    }
}

public extension AVMetadataItem{
    static func ToInfoDic(metaData:[AVMetadataItem]) -> [String?:Any?]?{
        var MP3Data : [String?:Any?] = [:]
        for metadataItem in metaData{
            if let key = metadataItem.commonKey?.rawValue ,let value = metadataItem.value{ MP3Data[key] = value}
            if let commkeyX = metadataItem.commonKey?.rawValue,commkeyX == "artwork",let artworkData = metadataItem.value as? Data {
                MP3Data["artwork"] = artworkData
            }
        }
        return MP3Data
    }
}



////////////////
//let audioInfo = MPNowPlayingInfoCenter.defaultCenter()
//var nowPlayingInfo:[String:AnyObject] = [:]
//let playerItem = AVPlayerItem(URL: url)
//let metadataList = playerItem.asset.metadata
//for item in metadataList {
//    if item.commonKey != nil && item.value != nil {
//        if item.commonKey  == "title" {
//            println(item.stringValue)
//            nowPlayingInfo[MPMediaItemPropertyTitle] = item.stringValue
//        }
//        if item.commonKey   == "type" {
//            println(item.stringValue)
//            nowPlayingInfo[MPMediaItemPropertyGenre] = item.stringValue
//        }
//        if item.commonKey  == "albumName" {
//            println(item.stringValue)
//            nowPlayingInfo[MPMediaItemPropertyAlbumTitle] = item.stringValue
//        }
//        if item.commonKey   == "artist" {
//            println(item.stringValue)
//            nowPlayingInfo[MPMediaItemPropertyArtist] = item.stringValue
//        }
//        if item.commonKey  == "artwork" {
//            if let image = UIImage(data: item.dataValue) {
//                nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(image: image)
//                println(image.description)
//            }
//        }
//    }
//}
//
//audioInfo.nowPlayingInfo = nowPlayingInfo

//do {
//    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
//    print("Playback OK")
//    try AVAudioSession.sharedInstance().setActive(true)
//    print("Session is Active")
//} catch {
//    print(error)
//}



//import ID3Edit
//...
//do
//{
//    // Open the file
//    let mp3File = try MP3File(path: "/Users/Example/Music/example.mp3")
//    // Use MP3File(data: data) data being an NSData object
//    // to load an MP3 file from memory
//    // NOTE: If you use the MP3File(data: NSData?) initializer make
//    //       sure to set the path before calling writeTag() or an
//    //       exception will be thrown
//
//    // Get song information
//    print("Title:\t\(mp3File.getTitle())")
//    print("Artist:\t\(mp3File.getArtist())")
//    print("Album:\t\(mp3File.getAlbum())")
//    print("Lyrics:\n\(mp3File.getLyrics())")
//
//    let artwork = mp3File.getArtwork()
//
//    // Write song information
//    mp3File.setTitle("The new song title")
//    mp3File.setArtist("The new artist")
//    mp3File.setAlbum("The new album")
//    mp3File.setLyrics("Yeah Yeah new lyrics")
//
//    if let newArt = NSImage(contentsOfFile: "/Users/Example/Pictures/example.png")
//    {
//        mp3File.setArtwork(newArt, isPNG: true)
//    }
//    else
//    {
//        print("The artwork referenced does not exist.")
//    }
//
//    // Save the information to the mp3 file
//    mp3File.writeTag() // or mp3.getMP3Data() returns the NSData
//    // of the mp3 file
//}
//catch ID3EditErrors.FileDoesNotExist
//{
//    print("The file does not exist.")
//}
//catch ID3EditErrors.NotAnMP3
//{
//    print("The file you attempted to open was not an mp3 file.")
//}
//catch {}



//func audioFileInfo(url: URL) -> NSDictionary? {
//    var fileID: AudioFileID? = nil
//    var status:OSStatus = AudioFileOpenURL(url as CFURL, .readPermission, kAudioFileFLACType, &fileID)
//
//    guard status == noErr else { return nil }
//
//    var dict: CFDictionary? = nil
//    var dataSize = UInt32(MemoryLayout<CFDictionary?>.size(ofValue: dict))
//
//    guard let audioFile = fileID else { return nil }
//
//    status = AudioFileGetProperty(audioFile, kAudioFilePropertyInfoDictionary, &dataSize, &dict)
//
//    guard status == noErr else { return nil }
//
//    AudioFileClose(audioFile)
//
//    guard let cfDict = dict else { return nil }
//
//    let tagsDict = NSDictionary.init(dictionary: cfDict)
//
//    return tagsDict
//}
