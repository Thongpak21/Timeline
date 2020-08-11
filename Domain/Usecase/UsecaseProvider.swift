//
//  UsecaseProvider.swift
//  Domain
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//


import Foundation

public protocol UseCaseProvider {

    func makeTimelineUsecase() -> TimelineUsecase
    func makeAlbumUsecase() -> AlbumUsecase
}
