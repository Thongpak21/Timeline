//
//  TimelineUsecase.swift
//  NetworkPlatform
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import RxSwift
import Domain

final class TimelineUsecase: Domain.TimelineUsecase {
    
    private let network: TimelineNetwork

    init(network: TimelineNetwork) {
        self.network = network
    }

    func fetchTimelines() -> Observable<[TimelineResult]> {
        return network.fetchTimeline()
            .asObservable()
            .map({ ($0.result ?? [TimelineResult]()) })
    }
}

