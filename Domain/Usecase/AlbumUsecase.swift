//
//  AlbumUsecase.swift
//  Domain
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import RxSwift

public protocol AlbumUsecase {
    func fetchAlbums(id: String) -> Observable<[AlbumResult]>
}
