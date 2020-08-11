//
//  TimelineUsecase.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import RxSwift

public protocol TimelineUsecase {
    func fetchTimelines() -> Observable<[TimelineResult]>
}
