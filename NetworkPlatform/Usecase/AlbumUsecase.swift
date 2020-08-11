//
//  AlbumUsecase.swift
//  NetworkPlatform
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import RxSwift
import Domain

final class AlbumUsecase: Domain.AlbumUsecase {
    
    private let network: AlbumNetwork

    init(network: AlbumNetwork) {
        self.network = network
    }

    func fetchAlbums(id: String) -> Observable<[AlbumResult]> {
        return network.fetchAlbum(id: id)
            .asObservable()
            .map({ ($0.result ?? [AlbumResult]()) })
    }
}

