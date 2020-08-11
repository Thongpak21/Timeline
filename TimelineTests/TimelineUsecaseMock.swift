//
//  TimelineUsecaseMock.swift
//  TimelineTests
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
@testable import Timeline
import RxSwift
import Domain

class TimelineUsecaseMock: Domain.TimelineUsecase {
    
    var timelineReturnValue: Observable<[TimelineResult]> = Observable.just([])
    var timelineCalled = false
    
    func fetchTimelines() -> Observable<[TimelineResult]> {
        timelineCalled = true
        return timelineReturnValue
    }

}
