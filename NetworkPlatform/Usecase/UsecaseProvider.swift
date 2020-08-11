//
//  UsecaseProvider.swift
//  NetworkPlatform
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    
    private let networkProvider: NetworkProvider

    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeTimelineUsecase() -> Domain.TimelineUsecase {
        return TimelineUsecase(network: networkProvider.makeTimelineNetwork())
    }
    
    public func makeAlbumUsecase() -> Domain.AlbumUsecase {
        return AlbumUsecase(network: networkProvider.makeAlbumNetwork())
    }
}
