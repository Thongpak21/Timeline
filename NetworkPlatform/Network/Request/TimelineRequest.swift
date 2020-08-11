//
//  TimelineRequest.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation

struct TimelineRequest: Codable {
    var format = "json"
    var accessToken: String
    var albumId: String?
    
    enum CodingKeys: String, CodingKey {
        case format = "_format"
        case accessToken = "access-token"
        case albumId = "album_id"
    }
}
