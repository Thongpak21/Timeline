//
//  Timeline.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation

public struct Timeline: Codable {
    public let result: [TimelineResult]?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
    }
}

public struct TimelineResult: Codable {
    public let id: String
    public let userId: String?
    public let title: String?
    public let link: Link?
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
        userId = ""
        link = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case title
        case link = "_links"
    }
}

public struct Link: Codable {
    public let `self`: HRef?
    public let edit: HRef?
    
    enum CodingKeys: String, CodingKey {
        case `self`
        case edit
    }
}


public struct HRef: Codable {
    public let hRef: URL?
    
    enum CodingKeys: String, CodingKey {
        case hRef = "href"
    }
}
