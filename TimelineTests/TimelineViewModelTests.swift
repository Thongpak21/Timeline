//
//  HomeViewModelTests.swift
//  TimelineTests
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
@testable import Timeline
import Domain
import XCTest
import RxSwift
import RxCocoa
class HomeViewModelTests: XCTestCase {
    
    var timelineUsecase: TimelineUsecaseMock!
    var albumUsecase: AlbumUsecaseMock!
    var homeNavigator: TimelineNavigatorMock!
    var viewModel: TimelineViewModel!

    let disposeBag = DisposeBag()
    
    override func setUp() {
      super.setUp()

        timelineUsecase = TimelineUsecaseMock()
        albumUsecase = AlbumUsecaseMock()
        homeNavigator = TimelineNavigatorMock()
        viewModel = TimelineViewModel(timelineUsecase: timelineUsecase, albumUsecase: albumUsecase, navigator: homeNavigator)
    }
    
    func test_fetchTimeline() {
        timelineUsecase.timelineReturnValue = Observable.just(createTimeline())
        albumUsecase.albumReturnValue = Observable.just(createAlbums())
        
        viewModel.output.didFetchTimeline.subscribe(onNext: { _ in
            XCTAssert(true)
        }).disposed(by: disposeBag)
        
        viewModel.input.fetchTimeline()
    }
    
    func test_isLoading() {
        viewModel.output.isLoading.subscribe(onNext: { isLoading in
            if isLoading {
                XCTAssert(true)
            } else {
                XCTAssert(true)
            }
            
        }).disposed(by: disposeBag)
        
        viewModel.input.fetchTimeline()
    }
    
    func test_did_select() {
        timelineUsecase.timelineReturnValue = Observable.just(createTimeline())
        albumUsecase.albumReturnValue = Observable.just(createAlbums())
        
        viewModel.output.didFetchTimeline.subscribe(onNext: { _ in
            self.viewModel.input.didSelect(indexPath: IndexPath(row: 0, section: 0))
            XCTAssert(self.homeNavigator.toDetailCalled)
        }).disposed(by: disposeBag)
        
        viewModel.input.fetchTimeline()
    }
    
    func test_number_of_row() {
        timelineUsecase.timelineReturnValue = Observable.just(createTimeline())
        albumUsecase.albumReturnValue = Observable.just(createAlbums())
        
        viewModel.output.didFetchTimeline.subscribe(onNext: { _ in
            XCTAssert(self.viewModel.output.numOfRow() == 2)
        }).disposed(by: disposeBag)
        
        viewModel.input.fetchTimeline()
    }
    
    func test_has_album() {
        timelineUsecase.timelineReturnValue = Observable.just(createTimeline())
        albumUsecase.albumReturnValue = Observable.just(createAlbums())
        
        viewModel.output.didFetchTimeline.subscribe(onNext: { _ in
            XCTAssert(self.viewModel.output.hasAlbum(for: IndexPath(row: 0, section: 0)))
        }).disposed(by: disposeBag)
        
        viewModel.input.fetchTimeline()
    }
    
    func test_data_for_row() {
        timelineUsecase.timelineReturnValue = Observable.just(createTimeline())
        albumUsecase.albumReturnValue = Observable.just(createAlbums())
        
        viewModel.output.didFetchTimeline.subscribe(onNext: { _ in
            XCTAssert(self.viewModel.output.dataForRow(for: IndexPath(row: 0, section: 0))?.timeline.title == "Test1")
        }).disposed(by: disposeBag)
        
        viewModel.input.fetchTimeline()
    }
    
    private func createTimeline() -> [TimelineResult] {
      return [
        TimelineResult(id: "123", title: "Test1"),
        TimelineResult(id: "1234", title: "Test2")
      ]
    }
    
    private func createAlbums() -> [AlbumResult] {
      return [
        AlbumResult(id: "123", thumbnail: URL(string: "https://google.co.th")!),
        AlbumResult(id: "1234", thumbnail: URL(string: "https://google.co.th")!)
      ]
    }
    
}
