//
//  XYZPath_XYZVideo.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit
import CoreAudio
import AVKit
import AVFoundation
import AssetsLibrary
 

public class XYZVideo: NSObject {
    
}


public extension AVAsset {
    
    enum audioFormat {case mp3,m4a}
    
    func writeAudioTrackToURL(_ url: URL, audioFormat:audioFormat = audioFormat.mp3,completion: @escaping (Bool, Error?) -> ()) {
        do {let audioAsset = try self.audioAsset()
            audioAsset.writeToURL(url, completion: completion)
        } catch (let error as NSError){ completion(false, error)}
    }
    
    func writeToURL(_ url: URL, completion: @escaping (Bool, Error?) -> ()) {
        guard let exportSession = AVAssetExportSession(asset: self, presetName: AVAssetExportPresetAppleM4A) else {completion(false, nil);return}
        exportSession.outputFileType = .m4a
        exportSession.outputURL      = url
        exportSession.exportAsynchronously {
            switch exportSession.status {
            case .completed:
                completion(true, nil)
            case .unknown, .waiting, .exporting, .failed, .cancelled:
                completion(false, nil)
            @unknown default:
                print("未知错误")
            }
        }
    }
    func audioAsset() throws -> AVAsset {
        let composition = AVMutableComposition()
        let audioTracks = tracks(withMediaType: .audio)
        for track in audioTracks {
            let compositionTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
            try compositionTrack?.insertTimeRange(track.timeRange, of: track, at: track.timeRange.start)
            compositionTrack?.preferredTransform = track.preferredTransform
        }
        return composition
    }
}

public func GetAudioFromVideo(videoURL: URL, completion: @escaping (Path?, Error?) -> Void) -> Void {
    let asset = AVURLAsset(url: videoURL, options: nil)
    let audioName = UUID().uuidString + ".m4a"
    let pathWhereToSave = userDocument + audioName
    asset.writeAudioTrackToURL(pathWhereToSave.url) { (success, error) -> () in
        if success {completion(pathWhereToSave,error)}else{print(error as Any)}
    }
}

public func removeAudioFromVideo(videoURL: URL, completion: @escaping (URL?, Error?) -> Void) -> Void {
    let composition = AVMutableComposition()
    let sourceAsset = AVURLAsset(url: videoURL)
    let compositionVideoTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
    let sourceVideoTrack: AVAssetTrack = sourceAsset.tracks(withMediaType: .video)[0]
    let x = CMTimeRangeMake(start: CMTime.zero, duration: sourceAsset.duration)
    try? compositionVideoTrack?.insertTimeRange(x, of: sourceVideoTrack, at: .zero)
    let newViewoName = UUID().uuidString + ".mov"
    let exportPath = userDocument + newViewoName
    let exportUrl = exportPath.url
    if exportPath.exists{try? exportPath.deleteFile()}
    let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality)
    exporter!.outputURL = exportUrl
    exporter!.outputFileType = AVFileType.mov//AVFileTypeQuickTimeMovie
    exporter?.exportAsynchronously(completionHandler: {
        DispatchQueue.main.async { completion(exporter?.outputURL, nil)}
    })
}

public func mergeAudioToVideo(souceAudioPath: Path, souceVideoPath: Path, completion: @escaping (URL?, Error?) -> Void) -> Void {
    let composition = AVMutableComposition()
    let videoAsset = AVURLAsset(url: souceVideoPath.url)
    let audioAsset = AVURLAsset(url: souceAudioPath.url)
    let audioTrack = composition.addMutableTrack(withMediaType: AVMediaType.audio, preferredTrackID: kCMPersistentTrackID_Invalid)
    try? audioTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: audioAsset.duration), of: audioAsset.tracks(withMediaType: .audio)[0], at: .zero)
    let composedTrack = composition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: kCMPersistentTrackID_Invalid)
    try? composedTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: videoAsset.duration), of: videoAsset.tracks(withMediaType: .video)[0], at: .zero)
    let newViewoName = UUID().uuidString + ".mov"
    let exportPath = userDocument + newViewoName
    let exportUrl = exportPath.url
    if exportPath.exists{try? exportPath.deleteFile()}
    let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality)
    exporter!.outputURL = exportUrl
    exporter!.outputFileType = .mov
    exporter?.exportAsynchronously(completionHandler: {
        DispatchQueue.main.async { completion(exporter?.outputURL, nil)}
    })
}

