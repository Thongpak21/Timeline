//
//  TimelineModel.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

protocol TimelineProtocolInput: class {
    func fetchTimeline()
    func didSelect(indexPath: IndexPath)
    
    func search(text: String)
}

protocol TimelineProtocolOutput: class {
    var isLoading: PublishSubject<Bool> { get set }
    
    var didFetchTimeline: PublishSubject<Void?> { get set }
    
    func numOfRow() -> Int
    func dataForRow(for indexPath: IndexPath) -> TimelineTableViewCellViewModel?
    func hasAlbum(for indexPath: IndexPath) -> Bool
}

protocol TimelineModelProtocol: TimelineProtocolInput, TimelineProtocolOutput {
    var input: TimelineProtocolInput { get }
    var output: TimelineProtocolOutput { get }
}

final class TimelineViewModel: TimelineModelProtocol, TimelineProtocolOutput, TimelineProtocolInput {
    
    var input: TimelineProtocolInput { return self }
    var output: TimelineProtocolOutput { return self }
    
    private let timelineUsecase: TimelineUsecase
    private let albumUsecase: AlbumUsecase
    private let navigator: TimelineNavigator
    fileprivate var timelines: [Domain.TimelineResult]?
    fileprivate var timelinesCache: [Domain.TimelineResult]?
    fileprivate var albums: [[Domain.AlbumResult]]?
    fileprivate let disposeBag = DisposeBag()
    var isLoading: PublishSubject<Bool> = PublishSubject<Bool>()
    var didFetchTimeline: PublishSubject<Void?> = PublishSubject<Void?>()
    
    init(timelineUsecase: TimelineUsecase, albumUsecase: AlbumUsecase, navigator: TimelineNavigator) {
        self.timelineUsecase = timelineUsecase
        self.albumUsecase = albumUsecase
        self.navigator = navigator
    }

    func fetchTimeline() {
        isLoading.onNext(true)
        timelineUsecase.fetchTimelines().do(onNext: { [weak self] (result) in
            guard let self = self else { return }
            self.timelines = result
            self.timelinesCache = result
        }).flatMap({ Observable.from($0) }).flatMap { (timeline) in
            return self.albumUsecase.fetchAlbums(id: timeline.id)
        }.toArray()
        .subscribe(onSuccess: { [weak self] (results) in
            guard let self = self else { return }
            self.isLoading.onNext(false)
            self.albums = results
            self.didFetchTimeline.onNext(nil)
        }).disposed(by: disposeBag)
    }
    
    
    func numOfRow() -> Int {
        return timelines?.count ?? 0
    }
    
    func dataForRow(for indexPath: IndexPath) -> TimelineTableViewCellViewModel? {
        if let timeline = timelines?[indexPath.row], let albums = albums?[indexPath.row] {
            return TimelineTableViewCellViewModel(with: timeline, albums: albums)
        } else {
            return nil
        }
    }
    
    func hasAlbum(for indexPath: IndexPath) -> Bool {
        if let album = albums?[indexPath.row] {
            return !album.isEmpty
        } else {
            return false
        }
    }
    
    func didSelect(indexPath: IndexPath) {
        if let timeline = timelines?[indexPath.row], let albums = albums?[indexPath.row] {
            navigator.toDetail(timeline: timeline, album: albums)
        }
    }
    
    func search(text: String) {
        if text.isEmpty {
            timelines = timelinesCache
        } else {
            timelines = timelinesCache?.filter({ ($0.title?.contains(text) ?? false) })
        }
        self.didFetchTimeline.onNext(nil)
    }
}
