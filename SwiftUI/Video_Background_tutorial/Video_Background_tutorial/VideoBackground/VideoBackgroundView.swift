//
//  VideoBackgroundView.swift
//  Video_Background_tutorial
//
//  Created by 백승엽 on 2022/03/29.
//

import Foundation
import SwiftUI
import AVFoundation
import UIKit

/// 비디오 백그라운드 뷰
struct VideoBackgroundView: View {
    var body: some View {
        ZStack {
            LoopingVideoPlayerView()
            Color.black.opacity(0.4)
        }// ZStack
        .edgesIgnoringSafeArea(.all)
    }
}

fileprivate struct LoopingVideoPlayerView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return LoopingVideoPlayerUIView(frame: .zero)
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

/// 반복 비디오 플레이어 UIView
fileprivate class LoopingVideoPlayerUIView: UIView {
    fileprivate var playerLayer = AVPlayerLayer()
    fileprivate var playerLooper: AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let videoFileUrl = Bundle.main.url(forResource: "love5", withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: videoFileUrl)
        
        // 플레이어 세팅
        let queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer.player = queuePlayer
        playerLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(playerLayer)
        
        
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        
        // Begin looping playback
        queuePlayer.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
