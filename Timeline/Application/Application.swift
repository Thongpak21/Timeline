//
//  Application.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import Domain
import NetworkPlatform
import UIKit

final class Application {
    
    var window: UIWindow
    private let networkUseCaseProvider: Domain.UseCaseProvider

    init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
        self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
        commonInit()
    }

    func commonInit() {
        let storyboard = UIStoryboard(name: "Timeline", bundle: nil)
        let cdNavigationController = UINavigationController()
        
        let timelineNavigator = DefaultTimelineNavigator(services: networkUseCaseProvider, navigationController: cdNavigationController, storyBoard: storyboard)

        window.rootViewController = cdNavigationController
        timelineNavigator.toHome()
    }
}
