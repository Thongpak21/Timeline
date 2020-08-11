//
//  Album.swift
//  Domain
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation

public struct Album: Codable {
    public let result: [AlbumResult]?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
    }
    
}

public struct AlbumResult: Codable {
    public let id: String!
    public let album_id: String?
    public let title: String?
    public let link: Link?
    public let url: URL?
    public let thumbnail: URL?
    
    public init(id: String, thumbnail: URL) {
        self.id = id
        album_id = ""
        title = ""
        link = nil
        url = nil
        self.thumbnail = thumbnail
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case album_id = "album_id"
        case title
        case link = "_links"
        case url
        case thumbnail
    }
}
