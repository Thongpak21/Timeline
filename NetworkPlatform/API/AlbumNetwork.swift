//
//  AlbumNetwork.swift
//  NetworkPlatform
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import RxSwift
import Domain

final class AlbumNetwork {
    private let network: Network<Album>

    init(network: Network<Album>) {
        self.network = network
    }

    func fetchAlbum(id: String) -> Observable<Album> {
        let request = TimelineRequest(accessToken: accessToken, albumId: id)
        let router = Router.photo(request: request)
        return network.request(router: router)
    }

}
