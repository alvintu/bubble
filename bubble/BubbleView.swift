//
//  BubbleView.swift
//  bubble
//
//  Created by Alvin Tu on 3/19/21.
//

import Foundation
import UIKit
import AVFoundation

class BubbleView: UIImageView {
    
    var player: AVQueuePlayer?
    var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper?
    var playerItem: AVPlayerItem?
    private var model: VideoModel?


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "bubble")

    }
    
    public func configure(with model: VideoModel) {
        self.model = model
//        configureVideo()
    }

    private func configureVideo() {
        guard let model = model else { return }
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else {
            print("failed to find video")
            return }
            player = AVQueuePlayer()
            playerLayer = AVPlayerLayer(player: player)
            playerItem = AVPlayerItem(url: URL(fileURLWithPath: path))
            playerLooper = AVPlayerLooper(player:player!, templateItem: playerItem!)
            playerLayer!.player = player
            playerLayer!.bounds = self.bounds
        playerLayer!.frame =  CGRect(x: self.bounds.width/4, y: self.bounds.height/4, width: self.bounds.width * 0.60, height: self.bounds.height * 0.60)

            self.layer.addSublayer(playerLayer!)
    //        player?.volume = 30.0
            player?.play()
        }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
