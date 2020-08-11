//
//  TimelineNetwork.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import RxSwift
import Domain

final class TimelineNetwork {
    private let network: Network<Timeline>

    init(network: Network<Timeline>) {
        self.network = network
    }

    func fetchTimeline() -> Observable<Timeline> {
        let request = TimelineRequest(accessToken: accessToken)
        let router = Router.timeline(request: request)
        return network.request(router: router)
    }

    
}
