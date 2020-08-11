//
//  NetworkProvider.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import Domain

final class NetworkProvider {
    
    public func makeTimelineNetwork() -> TimelineNetwork {
        let network = Network<Timeline>()
        return TimelineNetwork(network: network)
    }
    
    public func makeAlbumNetwork() -> AlbumNetwork {
        let network = Network<Album>()
        return AlbumNetwork(network: network)
    }
}
