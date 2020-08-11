//
//  HomeNavigatorMock.swift
//  TimelineTests
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
@testable import Timeline
import RxSwift
import Domain


class TimelineNavigatorMock: TimelineNavigator {
    
    var toHomeCalled = false
    
    func toHome() {
        toHomeCalled = true
    }
    
    var toDetailCalled = false
    
    func toDetail(timeline: TimelineResult, album: [AlbumResult]) {
        toDetailCalled = true
    }
    
}
