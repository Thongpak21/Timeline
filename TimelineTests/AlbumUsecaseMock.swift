//
//  AlbumUsecaseMock.swift
//  TimelineTests
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
@testable import Timeline
import RxSwift
import Domain

class AlbumUsecaseMock: Domain.AlbumUsecase {
    
    
    var albumReturnValue: Observable<[AlbumResult]> = Observable.just([])
    var albumCalled = false
    
    func fetchAlbums(id: String) -> Observable<[AlbumResult]> {
        albumCalled = true
        return albumReturnValue
    }

}
