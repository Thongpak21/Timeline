//
//  DetailViewModel.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

protocol DetailProtocolInput: class {
    
}

protocol DetailProtocolOutput: class {
    func numOfRow(in section: Int) -> Int
    func detail() -> TimelineTableViewCellViewModel?
    func album(in indexPath: IndexPath) -> AlbumResult
}

protocol DetailViewModelProtocol: DetailProtocolInput, DetailProtocolOutput {
    var input: DetailProtocolInput { get }
    var output: DetailProtocolOutput { get }
}

final class DetailViewModel: DetailViewModelProtocol, DetailProtocolInput, DetailProtocolOutput {
    
    var input: DetailProtocolInput { return self }
    var output: DetailProtocolOutput { return self }
    
    private let timeline: TimelineResult
    private let albums: [AlbumResult]
    private let navigator: DetailNavigator
    
    init(navigator: DetailNavigator, timeline: TimelineResult, albums: [AlbumResult]) {
        self.timeline = timeline
        self.albums = albums
        self.navigator = navigator
    }

    
    func numOfRow(in section: Int) -> Int {
        switch DetailViewController.TableViewIndex(rawValue: section)! {
        case .detail:
            return 1
        case .albums:
            return albums.count
        }
    }
    
    func detail() -> TimelineTableViewCellViewModel? {
        return TimelineTableViewCellViewModel(with: timeline, albums: [AlbumResult]())
    }
    
    func album(in indexPath: IndexPath) -> AlbumResult {
        return albums[indexPath.row]
    }
}
