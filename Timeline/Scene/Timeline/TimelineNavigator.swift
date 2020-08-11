//
//  HomeNavigator.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import UIKit
import Domain

protocol TimelineNavigator {
    func toHome()
    func toDetail(timeline: TimelineResult, album: [AlbumResult])
}

class DefaultTimelineNavigator: TimelineNavigator {
    private let storyBoard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProvider

    init(services: UseCaseProvider,
         navigationController: UINavigationController,
         storyBoard: UIStoryboard) {
        self.services = services
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func toHome() {
        let vc = storyBoard.instantiateViewController(ofType: TimelineViewController.self)
        vc.viewModel = TimelineViewModel(timelineUsecase: services.makeTimelineUsecase(),
                                     albumUsecase: services.makeAlbumUsecase(),
                                     navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }

    func toDetail(timeline: TimelineResult, album: [AlbumResult]) {
        let detailNavigator = DefaultDetailNavigator(navigationController: navigationController)
        let vc = detailNavigator.viewController
        vc.viewModel = DetailViewModel(navigator: detailNavigator, timeline: timeline, albums: album)
        navigationController.pushViewController(vc, animated: true)
    }

}
